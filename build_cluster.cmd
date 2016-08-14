:: Intel Corporation
:: AWS EMR Cluster Deployment Script

aws emr create-cluster --termination-protected 	--enable-debugging ^
	--name 				Phoenix_Cluster_replica				^
	--release-label 	emr-4.7.2 					^
	--service-role 		EMR_DefaultRole 			^
	--applications  	Name=Hadoop 				^
						Name=Phoenix 				^
						Name=HBase 					^
						Name=ZooKeeper-Sandbox		^
	--ec2-attributes 	file://./ec2attributes.json ^
	--instance-groups 	file://./instancegroups.json^
	--configurations 	file://./config.json 		^
	--log-uri 			s3n://mfs-serenity-emr/logs/^
	--region 			us-west-2					^
	--tags				Owner="nithin.vommi@intel.com"


:: Add "JAVA_OPTS":"\"$JAVA_OPTS -XX:MaxMetaspaceSize=512m\"" to config.json if required