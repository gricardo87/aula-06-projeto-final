# Projeto Final - Infraestrutura para Aplicação Web

Este projeto configura uma infraestrutura para uma aplicação web usando Terraform. O arquivo `main.tf` define recursos na Azure, como rede virtual, subnets, máquinas virtuais e regras de segurança.

## Visão Geral da Infraestrutura

### 1. **Recursos Criados**

#### a. **Grupo de Recursos**

- **Nome:** `var.resource_group_name`
- **Localização:** `var.resource_group_location`

#### b. **Rede Virtual**

- **Nome:** `student-vnet`
- **Espaço de Endereçamento:** `10.0.0.0/16`
- **Localização:** Localização do grupo de recursos.

#### c. **Subnet**

- **Nome:** `student-subnet`
- **Espaço de Endereçamento:** `10.0.1.0/24`
- **Rede Virtual:** `student-vnet`

#### d. **IP Público**

- **Nome:** `student-pip`
- **Método de Alocação:** Dinâmico

#### e. **Grupo de Segurança de Rede (NSG)**

- **Nome:** `student-nsg_HTTP`
- **Regras de Segurança:**
  - **HTTP:** Permite tráfego TCP na porta 80.
  - **SSH:** Permite tráfego TCP na porta 22.

#### f. **Interface de Rede (NIC)**

- **Nome:** `student-nic`
- **Subrede:** `student-subnet`
- **IP Público:** Associado ao `student-pip`

#### g. **Chave SSH**

- **Nome Gerado:** Aleatório, prefixo `ssh`
- **Tipo de Recurso:** `Microsoft.Compute/sshPublicKeys@2022-11-01`
- **Chave Pública e Privada**: Geradas e armazenadas.

#### h. **Máquina Virtual**

- **Nome:** `student-vm`
- **Tamanho:** `Standard_DS1_v2`
- **Imagem:** Ubuntu Server 22.04 LTS
- **Interface de Rede:** Associada ao `student-nic`
- **Usuário Admin:** Definido por `var.username`
- **Senha Admin:** Definida por `var.vm_admin_password`
- **Chave SSH:** Associada à chave pública gerada.

### 2. **Arquivos e Diretórios**

- **`main.tf`:** Arquivo principal do Terraform que define a infraestrutura.
- **`inventory.tpl`:** Modelo para gerar o arquivo de inventário Ansible.
- **`inventory.ini`:** Arquivo de inventário gerado localmente com IPs das VMs.
