# Resulting service level and cost

> TODO: update content with composite SLA and cost

Relecloud's solution has a ??? availability SLO and has an
estimated cost between $$$ and $$$ per month when
deployed to the East US and West US 2 Azure regions.

## Service Level Objective

Relecloud uses multiple Azure Services to achieve a composite
availability SLO of ...

To calculate this they reviewed their business scenario and
defined that the system is considered *available* when customers
can purchase tickets. This means that we can determine the
solution's availbility by finding the availability of the
Azure services that must be functioning to complete the checkout
process.

> This also means that the team *does not* consider Azure
> Monitor a part of their scope for an available web app. This
> means the team accepts that the web app might miss an alert
> or scaling event if there is an issue with Azure Monitor. If
> this were unacceptable then the team would have to add that
> as an additional Azure service for their availability
> calculations.

The next step to calculate the availability was to identify
the SLA of the services that must each be available to complete
the checkout process.

## Cost

The Relecloud team wants to use lower price SKUs for non-prod
workloads to manage costs while building testing environments.
To do this they added conditionals to their bicep templates
so they could choose different SKUs and optionally choose to
deploy to multiple regions when targeting production.

Pricing Calculator breakouts
- [Non-prod](https://azure.com/e/2a048617e85b41b9bc889cacf5cc8059)
- [Prod](https://azure.com/e/ccfe6f10bd394ad49257c99a9c07f43c)
