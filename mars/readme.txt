#mars 실행 순서 및 방법
# 공통
# 1. 클라우드에 서버 인스턴스를 생성
# 2. 서버 인스턴스의 IP 정보를 mars_add_hosts_config.sh에 기입
# 3. master 서버의 ip를 mars_master_config.sh에 기입
# 4. mars_worker_config.sh에 master ip 기입
# master 서버 설정
# 1. 100.mars_add_hosts_config.sh 실행
# 2. 200.mars_common_config.sh 실행
# 3. 300.mars_master_config.sh
# worker 서버 설정
# 1. 100.mars_add_hosts_config.sh 실행
# 2. 200.mars_common_config.sh 실행
# 3. 300.mars_worker_config.sh 실행
# docker registry 설정
# 1. 000.readme_docker_registry.txt 읽기