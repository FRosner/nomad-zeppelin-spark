job "zeppelin-job" {
  datacenters = ["dc1"]
  group "zeppelin-group" {
    task "zeppelin-task" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute
        command = "/usr/local/zeppelin/bin/zeppelin-nomad.sh"
      }
      resources {
        cpu = 250
        memory = 512
        network {
          mbits = 10
          port "http" {
            static = 8080
          }
        }
      }
    }
  }
  group "spark-master" {
    task "spark-master-task" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute
        command = "/usr/local/spark/bin/spark-class"
        args = ["org.apache.spark.deploy.master.Master", "--ip", "localhost", "--webui-port", "8081"]
      }
      resources {
        cpu = 250
        memory = 512
        network {
          mbits = 10
        }
      }
    }
  }
}
