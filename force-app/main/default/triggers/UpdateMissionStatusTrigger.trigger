trigger UpdateMissionStatusTrigger on Account (after update) {
    UpdateMissionStatusHandler.handleTrigger(Trigger.new, Trigger.oldMap);
}
