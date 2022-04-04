
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Diagrams/Network%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible file may be used to install only certain pieces of it, such as Filebeat.

[Filebeats](https://github.com/GSoliz/Elk-Stack-Project/tree/main/Ansible/Filebeat)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network. A load balancer plays a significant role in the security of the network by distributing traffic across multiple servers and preventing a network from becoming overloaded with requests.

*What is the advantage of a jump box?*
- A jump box can be used as a gateway to other servers while also preventing them from being exposed to the public internet.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.

*What does filebeats watch for?*

- Filebeat collects log data at specified locations then forwards them for indexing.

*What does Metricbeat record?*

- Metricbeat collects metrics from the OS such as cpu and memory and sends the statistical data to the specified location.

The configuration details of each machine may be found below.

| Name     | Function   | IP Address | Operating System |
|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.4   | Linux            |
| Elk      | Log Server | 10.1.0.4   | Linux            |
| Web 1    | Webserver  | 10.0.0.7   | Linux            |
| Web 2    | Webserver  | 10.0.0.8   | Linux            |
| Web 3    | Webserver  | 10.0.0.9   | Linux            |

[Virtual Machines in Azure](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/Azure%20VM.PNG)

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- Home Ip Address


Machines within the network can only be accessed by each other.

*Which machine did you allow to access your ELK VM?*

- Jump-Box-Provisioner

*What was its IP address?*

- 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name       | Publicly  Accessible | Allowed IP Addresses |
|------------|----------------------|----------------------|
| Jump-Box   | No                   | Public Home IP       |
| Elk Server | NO                   | 10.0.0.4             |
| Web-1      | NO                   | 10.0.0.4             |
| Web-2      | NO                   | 10.0.0.4             |
| Web-3      | NO                   | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because atomization saves time and reduces the risk of error. The steps listed below are automated into the [install-elk.yml]( https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/elk.yml) file which is one example of the great benefit of using the ansible automation process.

The playbook implements the following tasks: 

- 	Installs Docker.io and python3.pip

-   Increases the use of virtual memory

-	Downloads and launches the docker ELK container

-	Enables docker service on system boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![]( https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/Sudo_docker.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.7
- Web-2 10.0.0.8
- Web-3 10.0.0.9

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeats collects data such as user log ins on each machine and sends them to logstash and elaasticbeats. 

[Filebeat Data](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/Filebeat%20log%20data.PNG)

- Metricbeats- Collects the data from the vms to determine if they have enough size and memory to run correctly.  

[Metricbeat Data]( https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/Metric_data.PNG)


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration files to the /etc/ansible/files directory.
- Update the host file to include the private IP addresss of the webservers and elk server.
- Run the playbook and navigate to Kibana to check that the installation worked as expected.

*Which file is the playbook? Where do you copy it?*

There are three playbook files
- Elk Playbook
  - [Elk](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/elk.yml)
- Filebeat Playbook 
  - [Filebeat](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Filebeat/filebeat-playbook.yml)
- Metricbeat Playbook
  - [Metricbeat](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Metricbeat/metricbeat-playbook.yml)

These files are copied to /etc/ansible

![](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/etc-ansible.PNG)

*Which file do you update to make Ansible run the playbook on a specific machine?*

- /etc/ansible/hosts

How do I specify which machine to install the ELK server on versus which to install Filebeat on? 

The Image below shows the correct way to update the hosts file to specify the correct locations.

![](https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/hosts%20file.PNG)

*Which URL do you navigate to in order to check that the ELK server is running?*

- http://[your.VM.IP]:5601/app/kibana

![The Kibana Homepage]( https://github.com/GSoliz/Elk-Stack-Project/blob/main/Ansible/Images/Kibana.PNG)
