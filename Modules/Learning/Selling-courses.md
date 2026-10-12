# Sell courses

Sell a course like any other item in your catalog, and let the purchase enroll the buyer for you.

## Who it is for

Businesses that charge for their courses, or that offer free courses through the same checkout.

## Availability

You need the Learning module to publish courses, and the billing permissions of your workspace to invoice them and issue credit notes. Availability can depend on your plan.

## How a sale enrolls the buyer

A course is an item in your catalog. It can go on an invoice like a product or a service.

1. The buyer buys the course, or you invoice them for it.
2. When the invoice is paid in full, the buyer is enrolled in every course on that invoice.
3. The enrollment starts as **active**. The course appears in **My Courses** when the buyer signs in with the account linked to their contact.

You do not need to enroll the buyer yourself. If the buyer has no student profile in your workspace yet, one is created for them.

Each course on the invoice creates one enrollment. If the buyer already has access to the course, through an active or completed enrollment, no second enrollment is created.

## Free courses

A course with a price of zero is free. A free course still goes through a checkout, at no cost. When that checkout completes, the buyer is enrolled in the same way as for a paid course.

## Prices

You set a course's regular price, and its currency, through the Learning service of the REST API (`/api/v2/LearningService/Courses`). A course you create in Studio starts without a price, so it is free until you set one.

## Refunds

A full refund ends the enrollment.

A credit note against the invoice with the reason **Annulment** counts as the full refund. An annulment credits the full amount that can still be credited on the invoice. The credit note adjusts the invoice; returning the money to the buyer is a separate step. In Studio, go to **Accounting** > **Billing** > **Credit Notes**, create the note, and select **Issue credit note**.

When the credit note is issued:

- Every enrollment that the invoice created becomes **revoked**, and the course leaves the learner's **My Courses**.
- Enrollments that did not come from that invoice, such as one you created yourself, are not affected.
- A completion certificate the learner already holds stays valid.

A credit note with any other reason, such as a return or a discount, does not end the enrollment.

A revoked enrollment is final. If the learner buys the course again, they get a new enrollment.

## Related

- [Learning overview](../Learning.md)
- [Create and publish a course](Courses.md)
- [Students, instructors and enrollments](Students-and-instructors.md)
- [Invoices](../Accounting/Billing/Billing-Records/Invoices.md)
