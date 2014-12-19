package it.i_node.common.scheduling;

import it.i_node.tempemail.helpers.SynchronousQueueManager;

import java.util.Calendar;

import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.async.QuartzTriggerHandle;

@Name("scheduleController")
@AutoCreate
@Scope(ScopeType.APPLICATION)
@Startup
public class ScheduleController {
    
	private QuartzTriggerHandle testSchedulerHandle;
    private static String CRON_INTERVAL_TEMPMAILBOX = "0 * * * * ?";
    private static String CRON_INTERVAL_TEMPALIAS = "0 * * * * ?";  
    private static String MESSAGE_QUEUE_INTERVAL = "*/5 * * * * ?";
    private static String CRON_INTERVAL_TEMPUSER = "0 * * * * ?";

    

	public void startProcesses(){
		SynchronousQueueManager.instance().getTriggerHandler(Calendar.getInstance().getTime(),MESSAGE_QUEUE_INTERVAL);
		
		//TempMailboxRemovalScheduler mailboxRemovalScheduler=TempMailboxRemovalScheduler.instance();
		TempUserRemovalScheduler tempuserRemovalScheduler = TempUserRemovalScheduler.instance();
		//testSchedulerHandle=mailboxRemovalScheduler.getTriggerHandler(Calendar.getInstance().getTime(),CRON_INTERVAL_TEMPMAILBOX);
		testSchedulerHandle=tempuserRemovalScheduler.getTriggerHandler(Calendar.getInstance().getTime(),CRON_INTERVAL_TEMPUSER);
		TempAliasRemovalScheduler.instance().getTriggerHandler(Calendar.getInstance().getTime(), CRON_INTERVAL_TEMPALIAS);
	}
}
