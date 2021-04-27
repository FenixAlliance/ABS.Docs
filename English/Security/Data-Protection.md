At Fenix Alliance, we are committed to helping our customers meet their privacy and personal data requirements, as well as General Data Protection Regulation (GDPR). On this page, you will find information and resources to help you understand how the Alliance Business Suite supports protecting and enabling the privacy rights of individuals, and how we provide the information and tools that our customers need in order to define and support their specific obligations. You can read more about the Fenix Alliance commitment to security at the Fenix Alliance Trust Center.

## White papers, security reports, penetration tests, and risk assessment tools
To find detailed information about privacy and personal data for the Alliance Business Suite applications and services, visit the Alliance Business Suite Website. This site provides white papers, FAQs, security reports, penetration tests, risk assessment tools, and other resources. In particular, the site provides sales/technical guidance about how you should consider enhancing your data protection capabilities and how you might want to think about compliance as a process that has four stages: discover, manage, protect, and report.

## Data subject requests
The General Data Protection Regulation (GDPR) is fundamentally about protecting and enabling the privacy rights of individuals. The General Data Protection Regulation (GDPR) took effect on 25 May 2018. For information about the challenges and opportunities that GDPR brings for organizations in the context of their business applications, whether there are any specific risks and measures to be taken in the GDPR context, and any potential impact on how business applications need to be used.

The GDPR grants individuals (or data subjects) certain rights in connection with the processing of their personal data. These rights include the right to correct inaccurate data, erase their data or restrict its processing, receive their data, and fulfill a request to transmit their data to another controller. The resources in this section will help Alliance Business Suite customers respond to data subject requests (DSRs).To find information about what the GDPR requires of controllers (you) and processors (Fenix Alliance) when you respond to DSRs, and how Fenix Alliance enables you to do so, see DSRs on the Service Trust Portal.

## Compliance Manager
**Alliance Business Suite - Compliance Manager** is a modular cloud service solution that is designed to help organizations meet complex compliance obligations like the GDPR. It does real-time risk assessment that reflects your compliance posture against data protection regulations when you use Fenix Alliance's cloud services. It also provides recommended actions and step-by-step guidance.

## HTTPS Enforcement in the Alliance Business Suite.

Although no API can prevent a client from sending sensitive data on the first request. the Alliance Business Platform (which serves as a middleware for incoming/outgoing requests, as a rule of thumb, is designed to make sure that: 
- HTTPS is required for all requests.
- All HTTP requests are redirected to HTTPS.

**Note:** 
The Alliance Business platform should not listen on HTTP and will close the connection with status code 400 (Bad Request) and not serve the request.

