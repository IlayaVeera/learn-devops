---
# tasks file for role_ec2
- name: create vpc
  amazon.aws.ec2_vpc_net:
    name: "vpc_{{ region }}"
    cidr_block: "{{ vpc_cidr }}"
    region: "{{ region }}"
  register: vpc_info

- name: Create subnet
  amazon.aws.ec2_vpc_subnet:
    state: present
    vpc_id: "{{ vpc_info.vpc.id }}"
    cidr: "{{ subnet_cidr }}"
    map_public: true
    region: "{{ region }}"
  register: subnet_info

- name: create route table
  amazon.aws.ec2_vpc_route_table:
    vpc_id: "{{ vpc_info.vpc.id }}"
    region: "{{ region }}"
  register: route_table_info

- name: associate route table with subnet
  amazon.aws.ec2_vpc_route_table:
    route_table_id: "{{ route_table_info.route_table.route_table_id }}"
    subnets: "{{ subnet_info.subnet.id }}"
    vpc_id: "{{ vpc_info.vpc.id }}"
    region: "{{ region }}"

- name: Create VPC gateway
  amazon.aws.ec2_vpc_igw:
    vpc_id: "{{ vpc_info.vpc.id }}"
    region: "{{ region }}"
  register: vpc_igw

- name: add route table to IGW
  amazon.aws.ec2_vpc_route_table:
    route_table_id: "{{ route_table_info.route_table.route_table_id }}"
    routes:
      - dest: "0.0.0.0/0"
        gateway_id: "{{ vpc_igw.gateway_id }}"
    vpc_id: "{{ vpc_info.vpc.id }}"
    region: "{{ region }}"


