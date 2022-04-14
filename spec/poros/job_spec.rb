require "rails_helper"

RSpec.describe Job do
  it "exists with attributes" do
    data = {:contract_type=>"permanent",
            :salary_max=>160000,
            :__CLASS__=>"Adzuna::API::Response::Job",
            :id=>"2844213317",
            :company=>{:__CLASS__=>"Adzuna::API::Response::Company", :display_name=>"Layer1 Technologies"},
            :title=>"Applied Cryptography Engineer (Rust)",
            :category=>{:label=>"IT Jobs", :__CLASS__=>"Adzuna::API::Response::Category", :tag=>"it-jobs"},
            :latitude=>37.770051,
            :longitude=>-122.441408,
            :salary_is_predicted=>"0",
            :redirect_url=>"https://www.adzuna.com/land/ad/2844213317?se=Ev-L2YS77BGCEVbsF3PMqw&utm_medium=api&utm_source=5e859b54&v=BF9668CE5FF29CD456CD0952C90E8AC7569EBC86",
            :created=>"2022-01-26T06:40:24Z",
            :description=>
            "You will be working directly alongside Layer1's engineering leadership, so this role comes with significant autonomy and responsibility. We are deeply involved with a Rust-based coin with interactive transaction construction. As Applied Cryptography Engineer at Layer1, you will: Contribute to the project's general open-source protocol development Write advanced software tooling to interface with and analyze the protocol network Explore and implement Confidential Assets Build Critical infrastruc…",
            :adref=>"eyJhbGciOiJIUzI1NiJ9.eyJzIjoiRXYtTDJZUzc3QkdDRVZic0YzUE1xdyIsImkiOiIyODQ0MjEzMzE3In0.zxDdnzd9SNFhX3eeBZG0hH3ghX5hGiZkYZ_7juvtLTI",
            :salary_min=>120000,
            :location=>{:area=>["US", "California", "San Francisco", "Panhandle"], :__CLASS__=>"Adzuna::API::Response::Location", :display_name=>"Panhandle, San Francisco"}}

    job = Job.new(data)

    expect(job).to be_an_instance_of(Job)
    expect(job.salary_avg).to eq(140000)

    expect(job.location).to be_an_instance_of(Hash)
    expect(job.location).to eq({"state" => "California", "city" => "San Francisco"})

    expect(job.company).to eq("Layer1 Technologies")
    expect(job.apply).to eq("https://www.adzuna.com/land/ad/2844213317?se=Ev-L2YS77BGCEVbsF3PMqw&utm_medium=api&utm_source=5e859b54&v=BF9668CE5FF29CD456CD0952C90E8AC7569EBC86")
    expect(job.id).to eq("2844213317")
  end
end
