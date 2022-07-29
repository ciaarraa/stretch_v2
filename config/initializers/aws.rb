Aws.config.update({
    region: 'eu-west-1',
    credentails = Aws::Credentails.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_ACCESS_KEY']),
})