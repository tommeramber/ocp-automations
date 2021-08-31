---
You are required to make changes to the file "generate-pull-secret.yaml"

Then we will edit the /tmp/pull-secret.json file:
- name: "Creating a pull-secret.json file with content for all registries"
  copy:
   dest: "/tmp/pull-secret.json"
   content: |
    {
      "auths": {
        "myregistry:5000": {
           "auth": '{{output.stdout}}',
           "username": "{{user}}",
           "password": "{{password}}"
         },
         "https://quay.io": {
           "auth": '',
           "email": ""
         },
         "https://registry.redhat.io": {
           "auth": '',
           "username": '',
           "password": ''
         },
         "https://registry.connect.redhat.com": {
          "auth": '',
          "username": '',
          "password": ''
         }
       }
    }

The "myregistry:5000" is already configured properly using ansible variables and the output from the htpasswd decoding we did earlier.

Authentication to Quay.io and will be performed using an access token generated for a robot account with minimal privileges

1. Login to quay.io, or register if you don't have an account yet.


2. Generate a new Robot Account (Go to the following page (use your account in the path obviously) and press "Create Robot Account".


3. Make sure your robot account does not have access to your other repositories - we are going to use it for pulling porpuses only; (Gear Icon => Set Repository Permissions => Uncheck all)


4. Grab the token= Gear Icon => View Credentials => Docker Configuration


5. Copy the auth token and paste it into our YAML

---

Now we will do basically the same by generating a service account for registry.redhat.io, that will serve us for registry.connect.redhat.com as well.
Login to https://access.redhat.com/terms-based-registry/ and create a new Registry Service Account. 


Copy the username + press the copy button to copy the token, paste them both in the YAML (under both registry.redhat.io and registry.connect.redhat.com).


Also, go to the "Docker Configuration" tab and copy the "auth" into our YAML. 

The final yaml should look like that: 



(Don't worry about me. I've deleted the robots after writing it so they are not available anymore)
