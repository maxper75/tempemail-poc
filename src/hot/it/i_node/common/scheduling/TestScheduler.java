package it.i_node.common.scheduling;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.jboss.seam.Component;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.TransactionPropagationType;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.async.Asynchronous;
import org.jboss.seam.annotations.async.Expiration;
import org.jboss.seam.annotations.async.IntervalCron;
import org.jboss.seam.async.QuartzTriggerHandle;
import org.jboss.seam.log.Log;


@Name("testScheduler")
@Scope(ScopeType.APPLICATION)
public class TestScheduler {
	@Logger(value="scheduler") Log log;
	
	public static TestScheduler instance(){
		return (TestScheduler) Component.getInstance(TestScheduler.class);
	}
	@Asynchronous
	@Transactional(TransactionPropagationType.REQUIRED)
	public QuartzTriggerHandle getTriggerHandler(@Expiration Date date, @IntervalCron String CRON_INTERVAL) {
		// TODO Auto-generated method stub
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		System.out.println("Stampa della data in cui sto girando: ["+format.format(Calendar.getInstance().getTime())+"]");
		
		return null;
	}
}
