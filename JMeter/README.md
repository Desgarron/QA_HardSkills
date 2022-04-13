### Jmeter - Homework #1
#### Make a script with listed endpoints and give a load of 50, 250, 500 threads.


1. http://162.55.220.72:5005/get_method
- Request GET
```
name: str
age: int
```
2. http://162.55.220.72:5005/user_info_2
- Request POST
```
name: str
age: int
salary: int
```
3. http://162.55.220.72:5005/user_info_3
- Request POST
```
name: str
age: int
salary: int
```
4. http://162.55.220.72:5005/object_info_1
- Request GET
```
name: str
age: int
weight: int
```
5. http://162.55.220.72:5005/object_info_2
- Request GET
```
name: str
age: int
salary: int
```
6. http://162.55.220.72:5005/object_info_3
- Request GET
```
name: str
age: int
salary: int
```
7. http://162.55.220.72:5005/object_info_4
- Request GET
```
name: str
age: int
salary: int
```
-------------
### Jmeter - Homework #2

1. http://162.55.220.72:5005/user_info
- Request (RAW JSON)
```
POST
age: int
salary: int
name: str
auth_token
```
- Response
```json
{
  "start_qa_salary": "salary",
  "qa_salary_after_6_months": "salary * 2",
  "qa_salary_after_12_months": "salary * 2.9",
  "person": {
            "u_name":[
                      "user_name",
                      "salary",
                      "age"
                     ],
             "u_age": "age",
             "u_salary_1.5_year": "salary * 4"
             }
}
```
Action:
+ Get the value from the `"qa_salary_after_6_months"` field from Response and pass it to the salary field of the request http://162.55.220.72:5005/new_data
----------------------
2. http://162.55.220.72:5005/new_data
- Request
```
POST
age: int
salary: int
name: str
auth_token
```
- Response
```json
{
  "name": "name",
  "age": "int(age)",
  "salary": [
             "salary",
             "str(salary*2)",
             "str(salary*3)"
             ]
}
```
Actions:
+ Get the value from the `"name"` field from Respose and pass it to the name field of the request http://162.55.220.72:5005/new_data
----------------------
3. http://162.55.220.72:5005/test_pet_info
- Request
```
POST
age: int
weight: int
name: str
auth_token
```
- Response
```json
{
 "name": "name",
 "age": "age",
 "daily_food": "weight * 0.012",
 "daily_sleep": "weight * 2.5"
 }
```
Actions:
+ Get the value from the `"age"` field from Respose and pass it to the age field of the request http://162.55.220.72:5005/get_test_user

The task ***:
+ Learn how Response Assertion works
+ Make an Assertion to check status code 200
+ Make an Assertion to check `"daily_food": "weight * 0.012"`
----------------------
4) http://162.55.220.72:5005/get_test_user
- Request
```
POST
age: int
salary: int
name: str
auth_token
```
- Response
```json
{
 "name": "name",
 "age": "age",
 "salary": "salary",
 "family":{
           "children":[
                       ["Alex", 24],
                       ["Kate", 12]
                       ],
           "u_salary_1.5_year": "salary * 4"
           }
  }
```
The task ***:
+ Learn how Response Assertion works
+ Make an Assertion to check status code 200
+ Make an Assertion to check `"salary": "salary"`

-------------
### Jmeter - Homework #3


