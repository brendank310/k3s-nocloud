focal-server-cloudimg-amd64.img:
	wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

master/config.iso: master/network_config.yaml master/cloud_init.yaml
	cloud-localds --network-config=master/network_config.yaml ./master/config.iso ./master/cloud_init.yaml

master/ubuntu.img: focal-server-cloudimg-amd64.img
	cp focal-server-cloudimg-amd64.img master/ubuntu.img

.PHONY: master
master: master/config.iso master/ubuntu.img
	virt-install --name master --memory 2048 --vcpus 1 --disk ./master/ubuntu.img --disk ./master/config.iso,device=cdrom --import --network bridge=virbr0 --graphics vnc --os-variant ubuntu20.04 --console pty,target_type=serial

node0/config.iso: node0/network_config.yaml node0/cloud_init.yaml
	cloud-localds --network-config=node0/network_config.yaml ./node0/config.iso ./node0/cloud_init.yaml

node0/ubuntu.img: focal-server-cloudimg-amd64.img
	cp focal-server-cloudimg-amd64.img node0/ubuntu.img

.PHONY: node0
node0: node0/config.iso node0/ubuntu.img
	virt-install --name node0 --memory 2048 --vcpus 1 --disk ./node0/ubuntu.img --disk ./node0/config.iso,device=cdrom --import --network bridge=virbr0 --graphics vnc --os-variant ubuntu20.04 --console pty,target_type=serial --noautoconsole

node1/config.iso: node1/network_config.yaml node1/cloud_init.yaml
	cloud-localds --network-config=node1/network_config.yaml ./node1/config.iso ./node1/cloud_init.yaml

node1/ubuntu.img: focal-server-cloudimg-amd64.img
	cp focal-server-cloudimg-amd64.img node1/ubuntu.img

.PHONY: node1
node1: node1/config.iso node1/ubuntu.img
	virt-install --name node1 --memory 2048 --vcpus 1 --disk ./node1/ubuntu.img --disk ./node1/config.iso,device=cdrom --import --network bridge=virbr0 --graphics vnc --os-variant ubuntu20.04 --console pty,target_type=serial --noautoconsole

node2/config.iso: node2/network_config.yaml node2/cloud_init.yaml
	cloud-localds --network-config=node2/network_config.yaml ./node2/config.iso ./node2/cloud_init.yaml

node2/ubuntu.img: focal-server-cloudimg-amd64.img
	cp focal-server-cloudimg-amd64.img node2/ubuntu.img

.PHONY: node2
node2: node2/config.iso node2/ubuntu.img
	virt-install --name node2 --memory 2048 --vcpus 1 --disk ./node2/ubuntu.img --disk ./node2/config.iso,device=cdrom --import --network bridge=virbr0 --graphics vnc --os-variant ubuntu20.04 --console pty,target_type=serial --noautoconsole
