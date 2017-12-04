About
-----

CI environment based on Docker/GitHub/Jenkins/Nexus/Sonar/Selenium

Usage
-----

    $ vagrant up
    $ vagrant ssh
    vagrant $ \cd docker-ci-tools-stack && docker-compose logs --tail=0 --follow

Jenkins:        http://localhost:8080                 no login required
Nexus:          http://localhost:8081                 admin/admin123
Sonar:          http://localhost:9000                 admin/admin
Selenium:       http://localhost:4444/grid/console    no login required
Conference App: http://localhost:9090/currentSessions no login required
