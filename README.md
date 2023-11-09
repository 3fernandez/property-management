# Property Management

Just a simple Rails API(for property management), that address the proposed code assignment by Keepers.

## Setup

### Running the app:

```sh
git clone https://github.com/3fernandez/property-management
cd property-management
```

Using Docker and docker-compose:

- Make sure you rename the `.env.example` file to `.env` and set your desired values.

```sh
docker-compose build
docker-compose up
```

Using your local machine:

- Make sure you rename the `.env.example` file to `.env`, and point the values to your Postgres instance running locally or via docker.

```sh
bundle install
rails db:restart or rails db:create; rails db:migrate
rails s
```

**Heads Up:** Potential Issues with `bundle/Gemfile.lock`

If you encounter any issues with the `bundle` command or the `Gemfile.lock` file, it might be because the file was initially generated on an ARM64 computer. In such cases, you can resolve the issue by following these steps:

Delete the `Gemfile.lock` file from the project directory.
Run `bundle install` again on your computer, to ensure that the dependencies are correctly resolved for your computer's architecture.

After the above steps, the app should be available at your: `localhost:3000`

Then, you can issue some API requests like in the following screenshot:
<img width="1374" alt="Screenshot 2023-11-09 at 01 16 16" src="https://github.com/3fernandez/property-management/assets/3707769/6cc248ec-f0fe-4412-ae78-d73642e2314a">

### Running the tests:

```sh
bundle exec rspec
```

#### \*\* For some solution walk through, head over to [my_approach file](./my_approach.md)
