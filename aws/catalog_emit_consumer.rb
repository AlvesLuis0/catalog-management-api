require 'json'
require 'aws-sdk-s3'

def lambda_handler(event:, context:)
  s3 = Aws::S3::Client.new
  bucket = ENV.fetch('S3_BUCKET_NAME')

  event['Records'].each do |record|
    body = JSON.parse(record['body'])
    catalog = JSON.parse(body['Message'])
    key = "#{catalog['id']}-catalog.json"

    # envia para S3
    s3.put_object(
      bucket: bucket,
      key: key,
      body: body['Message'],
      content_type: 'application/json'
    )
  end

  { statusCode: 200 }
end
