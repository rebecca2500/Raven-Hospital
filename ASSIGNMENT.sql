--NO 1
select nurse.NurseName,nurse.NurseID,nurse.NurseAddress,nurse.NursePhoneNum,nurse.NurseBirthDate,nurse.Gender,Nurse.PositionHeld,Ward.WardName
from Nurse
inner join Ward on nurse.WardID=ward.WardID
where WardName= 'orthoapedic'

--NO 2
select Patient.PatientID,Patient.PatientFirstName,Patient.PatientLastName,patient.PatientPhoneNum,patient.PatientBirthdate,patient.Gender,patient.MaritalStatus, Appointment.AppointmentID
from Patient
inner join Appointment on Patient.PatientID=Appointment.PatientID;


--NO 3??
select (count(nurse.nurseid)) as TOTAL_NURSE, Nurse.PositionHeld,(sum(NursePosition.Salary))* (count(nurse.nurseid))as SALARY
from Nurse
inner join NursePosition on  Nurse.PositionHeld = nurseposition.positionheld
group by Nurse.PositionHeld



--NO 4
select nurse.nursename,ward.wardname
from nurse
join NursePosition on NursePosition.PositionHeld = Nurse.PositionHeld
join Ward on Ward.WardID = Nurse.WardID
where Nurse.PositionHeld = 'Head Nurse'
order by wardname asc

--NO 5
select Patient.PatientID,Patient.PatientFirstName,Patient.PatientLastName,patient.PatientPhoneNum,patient.PatientBirthdate,patient.Gender,patient.MaritalStatus
from Patient
join Inpatient on Patient.PatientID=inpatient.patientid
join Bed on Bed.BedID = inpatient.BedId
join ward on Ward.wardID = bed.wardID
where WardName= 'cardiology'

--NO 6

select count(Inpatient.PatientID) as totalpatient, Patient.Gender, Ward.WardName
from Inpatient
inner join patient on Inpatient.PatientID=Patient.PatientID
inner join Bed on Inpatient.BedID=Bed.BedID
inner join Ward on Bed.WardID=Ward.WardID
group by Ward.WardName,Gender



--NO 7
select bed.BedID , ward.WardName
from bed
left join Inpatient on Bed.BedID = Inpatient.BedID

join Ward on ward.WardID=Bed.WardID
where WardName = 'neurology' and Inpatient.InPatientID is null;

--NO8
select count(patient.patientid) as TOTAL_PATIENT, Doctor.DoctorName
from patient
inner join Appointment on Patient.PatientID = Appointment.PatientID
inner join NextApp on Appointment.PatientID=NextApp.PatientID
inner join Doctor on NextApp.DoctorID=Doctor.DoctorID
group by DoctorName
having DoctorName = 'Helen Cho'

--NO9
select Patient.PatientID,Patient.PatientFirstName,Patient.PatientLastName,patient.PatientPhoneNum,patient.PatientBirthdate,patient.Gender,patient.MaritalStatus
from Patient
inner join Inpatient on Patient.PatientID=Inpatient.PatientID
where Actual_CheckoutDate>CheckOut_Expectation
order by PatientFirstName ASC

--NO10
select kin.KinID,Kin.KinFullName, kin.KinAddress, kin.KinPhoneNum
from kin
join Patient on kin.KinID = Patient.KinID
where Patient.MaritalStatus = 'single'

select *
from NursePosition
