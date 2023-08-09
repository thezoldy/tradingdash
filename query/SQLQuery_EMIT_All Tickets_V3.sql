/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
      A.[sys_id]
	  ,A.[Assignment_Group]
	  ,A.[Parent]
	  ,B.[Parent_Incident]
	  ,B.[Problem]
	  ,A.[Number]
      ,A.[Task_Type]
	  ,A.[Priority]
      ,A.[Impact]
      ,A.[State] as 'SCTASK State'
	  ,B.[State] as 'INC State'
      ,A.[Urgency]
      ,A.[Short_Description]
	  ,B.[Customer]
	  ,A.[Assigned_To]
	  ,A.[Created_By]
	  ,A.[Updated_By]
	  ,B.[Resolved_By]
	  ,A.[Closed_By]
      ,A.[Created_Date]
	  ,A.[Updated_Date]
	  ,B.[Resolved_Date]
	  ,A.[Closed_Date]
	  ,C.[SLA_Definition]
	  ,C.[Has_Breached]
	  ,C.[Business_Elapsed_Time]
	  ,C.[Data_Refreshed_Date]
	  ,C.[Start_Time]
	  ,C.[Stop_Time]
	  ,C.[Breach_Time]
	  ,B.[Reopen_Count] as 'INC Re-open count'
	  ,A.[Updates]
	  ,B.[Resolution_Code]
	  ,A.[Configuration_Item]
	  ,E.[Application_ID]
	  ,D.[Tag_Name]
	  ,D.[Tag_Owner]
	  ,A.[Data_Refreshed_Date] as 'Task Refreshed Date'



   
  FROM
       [ITDW].[shared].[L1_SN_Task_Main] as A
	   Left outer Join [ITDW].[shared].L1_SN_Incident_Main As B on A.sys_id=B.sys_id
	   Left outer Join [ITDW].[shared].L1_SN_Task_SLA_Main As C on A.Number=C.Task and C.[SLA_Definition] like 'FIT-MSP%Pause%' and C.[Stage] <> 'Cancelled'
	   Left Outer Join [ITDW].[shared].[L1_SN_Tags_Main] As D on A.Number=D.[Key] and D.[Tag_Name] like 'EMH'
	   Left Outer Join [ITDW].[shared].L1_SN_Application_Main As E on A.CI_sys_id=E.sys_id
	   
	  

  WHERE
       A.[Task_Type] = 'Incident' and A.[Assignment_Group] in ('Supply Operations-EM-Marine','Supply Operations-EM-Rail&Truck','Supply Operations-EM-Pipeline','Fuels IT-Trading') 
	or A.[Task_Type] = 'Catalog task' and A.[Assignment_Group] in ('Supply Operations-EM-Marine','Supply Operations-EM-Rail&Truck','Supply Operations-EM-Pipeline','Fuels IT-Trading')