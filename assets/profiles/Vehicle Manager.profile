<?xml version="1.0" encoding="UTF-8"?>
<Profile xmlns="http://soap.sforce.com/2006/04/metadata">
    <applicationVisibilities>
        <application>Vehicle_Management</application>
        <default>true</default>
        <visible>true</visible>
    </applicationVisibilities>
    <custom>true</custom>
    <fieldPermissions>
        <editable>false</editable>
        <field>Maintance__c.Maintenance_Report__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Maintance__c.Maintenance_status__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Maintance__c.Scheduled_maintenance_date__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Service__c.Address__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Service__c.Geolocation__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Service__c.Total_maintenance__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Current_Milage__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Vehicle__c.Driver_Phone__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Driver__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Last_Maintenance_Date__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Last_Service__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Model__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Next_Maintenance_Date__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Plate_number__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Status__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Vehicle_Manager__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Vehicle_Weight__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Vehicle__c.Year__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <layoutAssignments>
        <layout>Maintance__c-Maintenance Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Service__c-Service Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Vehicle__c-Truck</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Vehicle__c-Truck</layout>
        <recordType>Vehicle__c.Truck</recordType>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Vehicle__c-Van</layout>
        <recordType>Vehicle__c.Van</recordType>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Vehicle__c-Van</layout>
        <recordType>Vehicle__c.Van1</recordType>
    </layoutAssignments>
    <objectPermissions>
        <allowCreate>false</allowCreate>
        <allowDelete>false</allowDelete>
        <allowEdit>false</allowEdit>
        <allowRead>true</allowRead>
        <modifyAllRecords>false</modifyAllRecords>
        <object>Maintance__c</object>
        <viewAllRecords>false</viewAllRecords>
    </objectPermissions>
    <objectPermissions>
        <allowCreate>false</allowCreate>
        <allowDelete>false</allowDelete>
        <allowEdit>false</allowEdit>
        <allowRead>true</allowRead>
        <modifyAllRecords>false</modifyAllRecords>
        <object>Service__c</object>
        <viewAllRecords>false</viewAllRecords>
    </objectPermissions>
    <objectPermissions>
        <allowCreate>true</allowCreate>
        <allowDelete>true</allowDelete>
        <allowEdit>true</allowEdit>
        <allowRead>true</allowRead>
        <modifyAllRecords>false</modifyAllRecords>
        <object>Vehicle__c</object>
        <viewAllRecords>false</viewAllRecords>
    </objectPermissions>
    <recordTypeVisibilities>
        <default>false</default>
        <recordType>Vehicle__c.Truck</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <recordTypeVisibilities>
        <default>true</default>
        <recordType>Vehicle__c.Van</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <tabVisibilities>
        <tab>Maintance__c</tab>
        <visibility>DefaultOn</visibility>
    </tabVisibilities>
    <tabVisibilities>
        <tab>Service__c</tab>
        <visibility>DefaultOn</visibility>
    </tabVisibilities>
    <tabVisibilities>
        <tab>Vehicle__c</tab>
        <visibility>DefaultOn</visibility>
    </tabVisibilities>
    <userLicense>Salesforce Platform</userLicense>
    <userPermissions>
        <enabled>false</enabled>
        <name>AccessCMC</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ActivitiesAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AddDirectMessageMembers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>AllowEmailIC</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>AllowLightningLogin</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AllowUniversalSearch</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AllowViewKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ApexRestServices</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ApiEnabled</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AssignTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>BotManageBots</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>BotManageBotsTrainingData</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanAccessCE</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanApproveFeedPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanUseNewDashboardBuilder</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanVerifyComment</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ChangeDashboardColors</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ChatterComposeUiCodesnippet</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterEditOwnPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ChatterEditOwnRecordPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterFileLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterInternalUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterInviteExternalUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterOwnGroups</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CloseConversations</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ConfigCustomRecs</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ConnectOrgToEnvironmentHub</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ConsentApiUpdate</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ContentHubUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ContentWorkspaces</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateCustomizeDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeFilters</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateDashboardFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateLtngTempFolder</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateLtngTempInPub</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateReportFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateReportInLightning</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateWorkspaces</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CustomMobileAppsAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CustomSidebarOnAllPages</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>DeleteTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DistributeFromPersWksp</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditBrandTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditEvent</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditHtmlTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditMyDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditMyReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditPublicDocuments</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditPublicFilters</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditPublicTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditTask</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EmailMass</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EmailSingle</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EmployeeExperience</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EnableCommunityAppLauncher</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EnableNotifications</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ExportReport</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>FeedPinning</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ForceTwoFactor</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>GiveRecognitionBadge</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>GovernNetworks</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>HideReadByList</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IPRestrictRequests</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IdentityEnabled</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ImportCustomObjects</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ImportPersonal</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IsotopeAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IsotopeLEX</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>LearningManager</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>LightningExperienceUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ListEmailSend</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>LtngPromoReserved01UserPerm</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageBusinessHourHolidays</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageContentPermissions</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageDashbdsInPubFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageDynamicDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageExternalConnections</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageHealthCheck</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageReportsInPubFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageSecurityCommandCenter</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageUnlistedGroups</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>MassInlineEdit</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>MergeTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ModerateChatter</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ModerateNetworkUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ModifyDataClassification</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>NativeWebviewScrolling</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>NewReportBuilder</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>Packaging2PromoteVersion</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>PasswordNeverExpires</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>PreventClassicExperience</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>PrivacyDataAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>QuipMetricsAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>QuipUserEngagementMetrics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>RemoveDirectMessageMembers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>RunFlow</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>RunReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SandboxTestingInCommunityApp</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SelectFilesFromSalesforce</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SendAnnouncementEmails</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SendCustomNotifications</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ShareInternalArticles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ShowCompanyNameAsUserBadge</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SkipIdentityConfirmation</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeDashboardRolesGrps</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeDashboardToOtherUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeReportRolesGrps</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeReportToOtherUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeReportsRunAsUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeToLightningDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeToLightningReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>TransactionalEmailSend</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>TransferAnyEntity</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>TwoFactorApi</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseWebLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewAllCustomSettings</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewAllForeignKeyNames</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewEncryptedData</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewFlowUsageAndFlowEventData</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewHealthCheck</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewHelpLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewMyTeamsDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewPublicDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewPublicReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewRoles</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewSecurityCommandCenter</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewSetup</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>WorkCalibrationUser</name>
    </userPermissions>
</Profile>
