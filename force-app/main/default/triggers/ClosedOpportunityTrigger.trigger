trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    // List to hold tasks to be created
    List<Task> followUpTasks = new List<Task>();
    
    // Iterate through the opportunities in the trigger context
    for (Opportunity opp : Trigger.new) {
        // Check if the opportunity stage is 'Closed Won'
        if ((opp.StageName == 'Closed Won') &&
        (Trigger.isInsert || (Trigger.isUpdate && Trigger.oldMap.get(opp.Id).StageName != 'Closed Won'))) {
            // Create a new task and set its properties
            Task followUpTask = new Task();
            followUpTask.Subject = 'Follow Up Test Task';
            followUpTask.WhatId = opp.Id; // Associate task with opportunity
            followUpTasks.add(followUpTask); // Add task to the list
        }
    }
    
    // Insert all tasks at once to avoid hitting governor limits
    if (!followUpTasks.isEmpty()) {
        insert followUpTasks;
    }
}