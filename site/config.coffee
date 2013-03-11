module.exports =
  title: 'COOK/HACK'
  subtitle: 'cookhub blog'
  description: 'Cookhub blog, a place for how cookhub built and new dishes from hubbers'
  url: 'http://blog.cookhub.me'
  s3:
    key: process.env.S3_KEY
    secret: process.env.S3_SECRET
    bucket: 'cookhub-blog'
  tracker_id: process.env.TRACKER_ID
  fb:
    key: process.env.FB_KEY
  disqus: true
