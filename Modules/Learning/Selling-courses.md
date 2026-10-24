# Sell courses

> **Coming.** Selling courses is not available yet. This page describes how it will work. Today, to give a learner a course, enroll them yourself; see [Students and instructors](Students-and-instructors.md).

You will be able to sell a course like any other item in your catalog, and let the purchase enroll the buyer for you.

## Who it is for

Businesses that charge for their courses.

## Availability

You need the Learning module to publish courses, and the billing permissions of your workspace to invoice them and issue credit notes. Availability can depend on your plan.

## How a sale will enroll the buyer

A course is an item in your catalog.

1. The buyer buys the course, or you invoice them for it.
2. When it is paid in full, the buyer is enrolled in every course they paid for.
3. The enrollment starts as **active**. The course appears in **My Courses** when the buyer signs in with the account linked to their contact.

You will not need to enroll the buyer yourself. If the buyer has no student profile in your workspace yet, one will be created for them.

Each course paid for will create one enrollment. If the buyer already has access to the course, through an active or completed enrollment, no second enrollment will be created.

## Free courses

To give a learner a course at no cost, enroll them yourself. See [Students and instructors](Students-and-instructors.md).

Coming: a free course that enrolls the learner through checkout, with no invoice to pay.

## Prices

Set a course's **Price** and **Currency** in Studio, in the course's create or edit form (see [Create and publish a course](Courses.md)). You can also set them through the Learning service of the REST API (`/api/v2/LearningService/Courses`). A price can't be negative, and the currency must be one of the currencies the platform knows; otherwise the course is not saved. A course with no price is free.

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
- [Vender cursos (español)](Selling-courses.es.md)
