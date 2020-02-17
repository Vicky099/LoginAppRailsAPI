1. SignUp API
	API:
		"localhost:3000/api/v1/users"
	Method:
		"POST"

	Request:
	{
		"user":{
			"name": "Vikram",
			"username": "vikram099",
			"email": "vikky.panmand@yahoo.com",
			"password": "12345678",
			"password_confirmation": "12345678"
		}
	}

	Response:
	{
	    "status": "success",
	    "code": 201,
	    "message": [
	        "User created successfully"
	    ],
	    "data": [
	        {
	            "id": 1,
	            "name": "Vikram",
	            "username": "vikram099",
	            "email": "vikky.panmand@yahoo.com",
	            "password_digest": "$2a$12$dgIBFsFlJv3Kj4TlVuicHeV1w2p89LB8xl.APDwIh4XnDFvonVsy2",
	            "created_at": "2020-02-17T03:56:22.410Z",
	            "updated_at": "2020-02-17T03:56:22.410Z"
	        }
	    ]
	}

2. Login API
	API:
		"localhost:3000/api/v1/auth/login"
	Method:
		"POST"
	Request:
		{
			"user":{
				"email": "vikky.panmand@yahoo.com",
				"password": "12345678"
			}
		}

	Response:
		{
		    "status": "success",
		    "code": 200,
		    "message": [
		        "Login successful"
		    ],
		    "data": [
		        {
		            "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODE5OTg4NDd9.9ca_Xk1HZggZ0R0wV_LxKkuTK99fFZWmjVrq32zkmtk",
		            "exp": "02-18-2020 09:37",
		            "username": "vikram099"
		        }
		    ]
		}


3. Get All Users
	API:
		"localhost:3000/api/v1/users"
	Method:
		"GET"

	Request: <Header Section>
			[
				{
					"key":"Authorization",
					"value":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODE5OTg4NDd9.9ca_Xk1HZggZ0R0wV_LxKkuTK99fFZWmjVrq32zkmtk",
					"description":"",
					"type":"text",
					"enabled":true
				}
			]
	Response:
		{
		    "status": "success",
		    "code": 200,
		    "message": [
		        "User details"
		    ],
		    "data": [
		        [
		            {
		                "id": 1,
		                "name": "Vikram",
		                "username": "vikram099",
		                "email": "vikky.panmand@yahoo.com",
		                "password_digest": "$2a$12$dgIBFsFlJv3Kj4TlVuicHeV1w2p89LB8xl.APDwIh4XnDFvonVsy2",
		                "created_at": "2020-02-17T03:56:22.410Z",
		                "updated_at": "2020-02-17T03:56:22.410Z"
		            }
		        ]
		    ]
		}
