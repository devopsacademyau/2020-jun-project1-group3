# Securing Internet Traffic

## TLS/SSL Certificate Creation

To enable secure connectivity to the Webserver, the TLS/SSL certificates are required.

1. Go to AWS Certificate Manager Console and Choose **Request Certificates**.

2. Choose Request Public Certificates. Provide the new Domain name details, and choose DNS validation.

3. Review the choices and confirm to submit the request. The Certificates will be created but will be in "Pending Validation" status.

4. Update DNS (Route53) records either by clicking on the button **Create Record in Route53** from the AWS Certificate Manager Console or go to Route53 console and create a simple routing Record set under the hosted zones for respective domain.
