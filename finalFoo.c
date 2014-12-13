#include <curl/curl.h>
#include <curl/easy.h>
#include <string.h>
#include "postgres.h"
#include "executor/spi.h"       	/* this is what you need to work with SPI */
#include "commands/trigger.h"   	/* ... triggers ... */
#include "utils/rel.h"          	/* ... and relations */
#include "access/htup_details.h"         /* nuovo include */

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

extern Datum prova(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(prova);

Datum
prova(PG_FUNCTION_ARGS)
{
    TriggerData *trigdata = (TriggerData *) fcinfo->context;
    TupleDesc   tupdesc;
    HeapTuple   rettuple;
    char       *when;
    bool        checknull = false;
    bool        isnull;
    int         ret, i;

    /* make sure it's called as a trigger at all */
    if (!CALLED_AS_TRIGGER(fcinfo))
        elog(ERROR, "prova: not called by trigger manager");

    /* tuple to return to executor */
    if (TRIGGER_FIRED_BY_UPDATE(trigdata->tg_event))
        rettuple = trigdata->tg_newtuple;
    else
        rettuple = trigdata->tg_trigtuple;

    /* check for null values */
    if (!TRIGGER_FIRED_BY_DELETE(trigdata->tg_event)
        && TRIGGER_FIRED_BEFORE(trigdata->tg_event))
        checknull = true;

    //PARTE NUOVA
    if (TRIGGER_FIRED_BY_INSERT(trigdata->tg_event))
    {
        rettuple = trigdata->tg_trigtuple;
        tupdesc = trigdata->tg_relation->rd_att;
        bool isnull2 = false;
        uint32 x=rettuple->t_len;
        int32 att = DatumGetInt32((heap_getattr(rettuple, 1, tupdesc, &isnull2)));
        elog(INFO,"len of tuple: %d",x);
        if (!isnull2)	{
            elog(INFO,"first column being inserted x: %d",att);
	    mioHttpRequest(att);				//BISOGNA PASSARE ATT
	}        
	else
            elog(INFO,"first column being inserted x: NULL"); 
    }
    //FINE PARTE NUOVA
    
    if (TRIGGER_FIRED_BEFORE(trigdata->tg_event))
        when = "before";
    else
        when = "after ";

    tupdesc = trigdata->tg_relation->rd_att;

    /* connect to SPI manager */
    if ((ret = SPI_connect()) < 0)
        elog(ERROR, "prova (fired %s): SPI_connect returned %d", when, ret);

    /* get number of rows in table */
    ret = SPI_exec("SELECT count(*) FROM ttest", 0);

    if (ret < 0)
        elog(ERROR, "prova (fired %s): SPI_exec returned %d", when, ret);

    /* count(*) returns int8, so be careful to convert */
    i = DatumGetInt64(SPI_getbinval(SPI_tuptable->vals[0],
                                    SPI_tuptable->tupdesc,
                                    1,
                                    &isnull));

    elog (INFO, "prova (fired %s): there are %d rows in ttest", when, i);

    SPI_finish();

    if (checknull)
    {
        SPI_getbinval(rettuple, tupdesc, 1, &isnull);
        if (isnull)
            rettuple = NULL;
    }

    return PointerGetDatum(rettuple);
}

/* function prototypes to define later */
char *do_web_request(char *url);
size_t static write_callback_func(void *buffer,
                        size_t size,
                        size_t nmemb,
                        void *userp);

/* the main function invoking */
int mioHttpRequest(int32 att)
{
    char url[100] = "http://vm-dbmail.sede.i-node.it:8080/tempemail/seam/resource/restv1/tempemail/messageid/";
    char num[10];
    sprintf(num,"%d",att);
    char *content = NULL;
    strcat(url,num);
    content = do_web_request(url);
    elog(INFO,"risposta: %s",content);
    //printf("%s", content);
}

/* the function to return the content for a url */
char *do_web_request(char *url)
{
    /* keeps the handle to the curl object */
    CURL *curl_handle = NULL;
    /* to keep the response */
    char *response = NULL;

    /* initializing curl and setting the url */
    curl_handle = curl_easy_init();
    curl_easy_setopt(curl_handle, CURLOPT_URL, url);
    curl_easy_setopt(curl_handle, CURLOPT_HTTPGET, 1);

    /* follow locations specified by the response header */
    curl_easy_setopt(curl_handle, CURLOPT_FOLLOWLOCATION, 1);

    /* setting a callback function to return the data */
    curl_easy_setopt(curl_handle, CURLOPT_WRITEFUNCTION, write_callback_func);

    /* passing the pointer to the response as the callback parameter */
    curl_easy_setopt(curl_handle, CURLOPT_WRITEDATA, &response);

    /* perform the request */
    curl_easy_perform(curl_handle);

    /* cleaning all curl stuff */
    curl_easy_cleanup(curl_handle);

    return response;
}

/* the function to invoke as the data recieved */
size_t static write_callback_func(void *buffer,
                        size_t size,
                        size_t nmemb,
                        void *userp)
{
    char **response_ptr =  (char**)userp;

    /* assuming the response is a string */
    *response_ptr = strndup(buffer, (size_t)(size *nmemb));

}
