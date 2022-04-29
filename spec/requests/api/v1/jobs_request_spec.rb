require 'rails_helper'

RSpec.describe 'jobs api' do
  it "sends a list of jobs for a given state and city" do
    VCR.use_cassette("sf yerbs") do
      get "/api/v1/jobs?where=denver,co"

      expect(response).to be_successful

      jobs = JSON.parse(response.body, symbolize_names: true)

      expect(jobs).to have_key(:data)
      expect(jobs[:data]).to be_an(Array)

      jobs[:data].each do |job|
        expect(job).to have_key(:id)
        expect(job[:id]).to be_a(String)

        expect(job).to have_key(:type)
        expect(job[:type]).to eq("job")

        expect(job[:attributes]).to have_key(:location)
        expect(job[:attributes][:location]).to be_an(Hash)

        # expect(job[:attributes][:location]).to have_key(:city)
        # expect(job[:attributes][:location][:city]).to be_a(String)

        expect(job[:attributes][:location]).to have_key(:state)
        expect(job[:attributes][:location][:state]).to be_a(String)

        expect(job[:attributes]).to have_key(:company)
        expect(job[:attributes][:company]).to be_a(String)

        expect(job[:attributes]).to have_key(:contact)
        expect(job[:attributes][:contact]).to be_a(String)

        expect(job[:attributes]).to have_key(:salary)
        expect(job[:attributes][:salary]).to be_an(Integer)
      end
    end
  end

  xit 'can save a job to the database' do


    response = "{\'id\':\'3031241203\',\'salary\':\'264000\',\'city\':\'Denver\',\'state\':\'Colorado\',\'company\':\'Pinnacol Assurance\',\'contact\':\'https://www.adzuna.com/land/ad/3031241203?se=5nNA3FO_7BGb_FUCEt2eFw\\u0026utm_medium=api\\u0026utm_source=5e859b54\\u0026v=FDB8D528EA6A79B8D27E5BAD6BC29C8B1AFCC7E6\'}"
    # job_data = JSON.parse(response, symbolize_names: true)
    #  
    post "/api/v1/jobs?job=#{response}"
    jobject = Job.find_by(api_job_id: job_data[:id])
    # user = User.find_by(email: job_data[:email])
    # user_job = UserJob.find_by(job_id: jobject.id, user_id: user.id)
    # expect(response).to be_successful
    expect(jobject.api_job_id).to eq(job_data[:id].to_i)
    # expect(user.email).to eq(job_data[:email])
    # expect(user_job).to be_a(UserJob)
  end

  it 'can delete a job' do
    user = User.create!(email: "someemail")
    job_1 = Job.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    job_2 = Job.create!(salary: 5000000, location: "Houston, TX", company: "Texas Tech", contact: "Chad Brad", api_job_id: 1112, title: "Tech Person")

    UserJob.create!(user_id: user.id, job_id: job_1.id)
    UserJob.create!(user_id: user.id, job_id: job_2.id)
    expect(user.jobs.count).to eq(2)

    delete "/api/v1/user/jobs/#{job_1.id}?user_id=#{user.id}"

    expect(user.jobs.count).to eq(1)
  end
end
