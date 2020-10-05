Global class SkillBasedRouting {

    @ Invocablemethod
    public static void routeUsingSkills(List<String> cases){
        List<Case> caseObjects = [Select id, Description, Language__c from Case where Id =: cases];
        
        for(Case CaseObj : caseObjects){    
            PendingServiceRouting psrObj = new PendingServiceRouting(
            CapacityWeight = 1,
            IsReadyforRouting  = FALSE,
            RoutingModel = 'MostAvailable',
            RoutingPriority = 1,
            RoutingType = 'SkillsBased',
            ServiceChannelId  = getChannelId('Case'),
            WorkItemId = CaseObj.id
            );
            insert psrObj;
            
            psrObj = [Select id, isReadyforRouting from PendingServiceRouting where id =:psrObj.Id];
            SkillRequirement srm = new SkillRequirement(
            	RelatedRecordId= psrObj.id,
                skillId = getSkillId(CaseObj.Language__c)
            );
            insert srm;
            
            psrObj.isReadyforRouting = TRUE;
            update psrObj;
        }
          return;  
    }
    
    public Static String getChannelId(String ChannelName){
        ServiceChannel channel = [Select id, Developername  from ServiceChannel where Developername=: ChannelName];
        return channel.id;
    }
    
    public Static String getSkillId(String CaseLanguage){
        String SkillName = 'English';
        if(CaseLanguage != NULL)
            SkillName = CaseLanguage;
        
    	Skill skill = [Select id from Skill where DeveloperName=:SkillName];
    	return skill.Id;
    }
    
}