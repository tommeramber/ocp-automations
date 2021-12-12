Before running the playbook, make sure to access: https://console.redhat.com/openshift/install/pull-secret and download a pull-secret.json file to `/tmp/pull-secret.json`

The "myregistry:5000" is already configured properly using ansible variables and the output from the htpasswd decoding we did earlier.

Authentication to Quay.io and will be performed using an access token generated for a robot account with minimal privileges

1. Login to [https://quay.io](quay.io), or register if you don't have an account yet.


2. Generate a new Robot Account (Go to the following page (use your account in the path obviously) and press "Create Robot Account".

![image](https://user-images.githubusercontent.com/60185557/131517625-5d98cc5c-5b74-4e69-9ee1-b55f276b99a4.png)

3. Make sure your robot account does not have access to your other repositories - we are going to use it for pulling porpuses only; (Gear Icon => Set Repository Permissions => Uncheck all)


4. Grab the token= Gear Icon => View Credentials => Docker Configuration

![image](https://user-images.githubusercontent.com/60185557/131517581-0cfde36d-ea60-4d53-872d-857c84e377c9.png)

5. Copy the auth token and paste it into our YAML


Now we will do basically the same by generating a service account for registry.redhat.io, that will serve us for registry.connect.redhat.com as well.
Login to https://access.redhat.com/terms-based-registry/ and create a new Registry Service Account. 

![image](https://user-images.githubusercontent.com/60185557/131517445-a12bcde1-d1e1-4a9c-9017-b13d19ae166b.png)

Copy the username + press the copy button to copy the token, paste them both in the YAML (under both registry.redhat.io and registry.connect.redhat.com).

Also, go to the "Docker Configuration" tab and copy the "auth" into our YAML. 

![image](https://user-images.githubusercontent.com/60185557/131517509-02d667c8-e3ad-4047-bb8b-0ff62351b0fe.png)

The final yaml should look like that: 

![image](https://user-images.githubusercontent.com/60185557/131517533-16f7f0ec-2da8-4311-be1c-e3d455c605e1.png)


(Don't worry about me. I've deleted the robots after writing it so they are not available anymore)
