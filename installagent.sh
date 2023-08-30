# INSTALAR SUDO

yum install sudo -y

# INSTALAR WGET

sudo yum install wget -y



# INSTALAR O ZABBIX 5.0 AGENT
sudo yum install https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm -y


# INSTALAR VIM, ZABBIX AGENT E ZABBIX SENDER
sudo yum install vim zabbix-agent zabbix-sender

# COPIA ARQUIVO COM CONFIGURACOES PRE DEFINIDAS
cp ./zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf


# RESTARTA AGENTE DO ZABBIX PARA PEGAR NOVA CONFIGURACAO
sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent


# LIBERA NO FIREWALL A PORTA 10050 (Porta utilizada pelo Agente)
sudo firewall-cmd --permanent --add-port=10050/tcp
sudo firewall-cmd --reload