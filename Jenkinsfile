def litecoin_repo = 'https://github.com/c-raj/litecoin.git'

properties([
  parameters([
    string(name: 'litecoin_repo_branch', description: 'Branch to build and deploy Litecoin from', defaultValue: 'main'),
    string(name: 'image_repo_tag', description: 'Full Docker image name with repository included.', defaultValue: 'c-raj/litecoin'),
    string(name: 'kubeconfig', description: 'The name of the kubeconfig file in your Jenkins .kube directory', defaultValue: 'dev')
  ])
])

throttle([]) {
  node() {
    timestamps {
      try {

        git url: litecoin_repo, branch: params.litecoin_repo_branch

        stage('Build') {
          sh """
            docker build -t ${params.image_repo_tag}:latest .
            docker push ${params.image_repo_tag}:latest
          """
        }

        stage('Deploy') {
          sh """
            kubectl --kubeconfig ~/.kube/${params.kubeconfig} apply -f statefulset.yaml
          """
        }
      } catch (ex) {
        currentBuild.result = 'FAILURE'

        sh """
          echo FAILURE
        """
      }

    }
  }
}