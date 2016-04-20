job "zeppelin-job" {
  datacenters = ["dc1"]
  group "zeppelin-group" {
    task "zeppelin-task" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute
        #command = "/usr/local/zeppelin/bin/start-zeppelin-nomad.sh"
        command = "/Users/frosner/Documents/projects/nomad-zeppelin-spark/start-zeppelin-nomad.sh"
      }
      resources {
        cpu = 250
        memory = 512
        network {
          mbits = 10
          port "ui" {}
        }
      }
    }
  }
  group "spark-master" {
    task "spark-master-task" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute
        command = "/Users/frosner/Documents/projects/nomad-zeppelin-spark/start-spark-nomad.sh"
      }
      resources {
        cpu = 250
        memory = 512
        network {
          mbits = 10
          port "webui" {}
          port "master" {}
        }
      }
    }
  }
}
