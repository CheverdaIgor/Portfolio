select max(RecordID)
     from Valera.Maintable
     where (ProblemID = 1050) and (ApplicationStatus = '�������') and
           (PhoneNumber = '989719231') and (recorddate >= '20.06.2012');

select UserName
           from VALERA.MainTable M
           where M.RecordID = (select MM.RecordID
                               from VALERA.MainTable MM
                               where MM.ProblemID = 1050
                               and MM.ApplicationStatus = '�������'
                               and MM.Phonenumber = '989719231');
