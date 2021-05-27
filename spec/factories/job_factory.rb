# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    id { 0 }

    initialize_with { new(attributes) }
  end

  factory :so_job do
    id { 0 }
    author { 'Hubert Burda Media' }
    categories { %w[python django sass javascript xss] }
    published { Time.parse('Thu, 13 May 2021 14:21:20 Z') }
    summary { '<p><strong>Fullstack Software Developer (m/f/d) Python at Netdoktor</strong></p><br /><p><strong>What you can expect from us ...</strong></p><br /><ul><br /><li>We work as a self-organizing scrum team</li><br /><li>You develop new product features together in a team and in close cooperation with the product management team as well as other departments</li><br /><li>You have a significant impact on the system and software architecture and enable us to further scale traffic and the amount of data</li><br /><li>We work with the Atlassian stack (Jira, Bitbucket, Bamboo)</li><br /><li>We use the best tools and technologies for the respective task, e.g. Python, Django, Django CMS, Docker, uWSGI, PostgreSQL, MySQL, Redis, Sass, TypeScript, Webpack, NPM, Polymer 3, Web Components</li><br /></ul><br /><p><strong>What we can offer you ...</strong></p><br /><ul><br /><li>We are a dynamic and enthusiastic team in which you have the opportunity to share your own ideas in exciting projects and actively be part of creating products</li><br /><li>As a 100 % subsidiary of Hubert Burda Media, you profit from the benefits of a modern company</li><br /><li>You will find flexible working hours, free coffee and beverages and lots of healthy fruit</li><br /><li>We&rsquo;re located in the heart of Munich, easily accessible by public transport</li><br /></ul><br /><p><strong>What we would expect from you ...</strong></p><br /><ul><br /><li>At least five years of project experience in the development of web systems in a python environment among others</li><br /><li>Experience in various frameworks, setup and testing</li><br /><li>Technical know-how in web, e.g. Cache systems or performance, databases, SOA via REST or RPC, Security Related Issues (XSS, SQL Injections etc.), Sass, TypeScript, JavaScript, CSS3, HTML5, Web Components</li><br /><li>Affinity to sustainability in software projects: The core principles of clean code, documentation, reviews and design, traceability by structured implementation, TDD or Pair programming</li><br /></ul><br /><p><strong><a href="https://career5.successfactors.eu/career?company=burda&amp;career_job_req_id=1555&amp;career_ns=job_application" rel="nofollow">Apply now</a></strong></p><br /><p><strong>Contact</strong><br> Marius Detmar<br> Recruiting Center<br> <a rel="nofollow">bewerbung@burda.com</a><br> <a href="https://www.burda.com/de/" rel="nofollow">www.burda.de</a></p>' }
    title { 'Fullstack Software Developer (m/f/d) Python at Netdoktor at Hubert Burda Media (München, Deutschland)' }
    updated { Time.parse('2021-05-13T14:21:20Z') }
    url { 'https://stackoverflow.com/jobs/523915/fullstack-software-developer-m-f-d-python-at-hubert-burda-media?a=2PHHpzo2yN3O&so_medium=Talent&so_source=TalentApi' }

    initialize_with { new(attributes) }
  end
end
