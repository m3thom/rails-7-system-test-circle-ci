Grover.configure do |config|
  config.options = {
      format: 'A4',
      print_background: true,
      wait_until: 'networkidle2',
      launch_args: ["--font-render-hinting=none", "--no-sandbox", '--disable-setuid-sandbox'],
      margin: {
          top: '2.5cm',
          bottom: '2.5cm',
          right: '2.5cm',
          left: '2.5cm',
      },
      executable_path: ENV.fetch("BROWSER_PATH", nil) # for tests in CircleCI
  }
end
