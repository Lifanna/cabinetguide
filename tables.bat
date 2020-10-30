cd C:\Sites\cabinetguide 
start rails g model Region name:string isDeleted:boolean &
rails g model City name:string region_id:integer isDeleted:boolean &
rails g model Subject name:string isDeleted:boolean &
rails g model Language name:string isDeleted:boolean &
rails g model Department name:string isDeleted:boolean &
rails g model Manager name:string department_id:integer isDeleted:boolean &
rails g model EducationForm name:string isDeleted:boolean &
rails g model EducationProgram name:string isDeleted:boolean &
rails g model InstitutionType name:string isDeleted:boolean &
rails g model Institution name:string institution_type_id:integer city_id:integer isDeleted:boolean &
rails g model User first_name:string last_name:string email:string phone:string &
rails g model Request user_id:integer institution_id:integer education_program_id:integer department_id:integer education_form_id:integer language_id:integer subject_id:integer question:text isDeleted:boolean
