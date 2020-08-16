## Creation of New Domain

1. Login to the Free Domain provider (example dot.tk) and register for a Domain Name.

2. Go to Route53 Console in AWS. Create a **Hosted Zone** with the new domain name registered. Note down the Name Server details created for this Domain.

  ![AWS NAMESERVER](../images/AWS-NameServer.png)


3. Login to Free Domain provider again, and go to **My Domains** and choose the new domain registered. Select **Manage Domains** and then choose **Management Tool** and add the new nameserver details provided by AWS (in step 2) under Custom Name server details.




