# Problem Statement

A three-tier architecture is a software architecture pattern where the application is broken down into three logical tiers: the presentation layer, the business logic layer and the data storage layer.

# Approach

I have designed a very simple 3 tier architechture in Azure public cloud , and used terraform to deploy all the resources. There are two virtual machines set up and connected to a SQL database for the storage. A Load balancer is set up to manage the incoming traffic to the VMs. 

Following resources have been implemeneted

1. Vnet
2. Subnet
3. 2 Network interface card for both VM
4. Load balancer
5. SQL database instance
6. 2 Vitual michines in one Avalability Zone ( High Avalability )

![image](https://user-images.githubusercontent.com/31053231/179350782-337cb878-3042-437a-b4b4-db889fb9528d.png)

# dependencies

1. We need to install terraform 
2. Active Azure Subscription
3. Azure CLI , For autentication to the Azure  
