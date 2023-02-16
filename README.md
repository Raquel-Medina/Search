# My Project

Pinal County department search applications.

## Using This Template

Remove this section after initial setup!

Search for and replace the following placeholders within this file:

| Placeholder | Example |
| --- | --- |
| `#ACQUIA_CLOUD_URL` | https://cloud.acquia.com/app/develop/applications/12345678-1234-1234-12345678901234567 |
| `#GIT_PRIMARY_DEV_BRANCH` | `master` or `develop` |
| `#GITHUB_ORG` | The "org" in https://github.com/org/project |
| `#GITHUB_PROJECT` | The "project" in https://github.com/org/project |
| `#JIRA_URL` | https://org.atlassian.net/projects/PROJ |
| `#LOCAL_DEV_SITE_ALIAS` | `@example.local` |
| `#LOCAL_DEV_URL` | http://local.example.com/ |
| `#TRAVIS_URL` | https://travis-ci.com/org/PROJ |

# Getting Started

This project is based on best practices. 

1. Review the [Required / Recommended Skills]
2. Ensure that your computer meets the minimum installation requirements (and then install the required applications).
3. Request access to organization that owns the project repo in GitHub (if needed).
4. Fork the project repository in GitHub.
5. Clone your forked repository. By default, Git names this "origin" on your local.
    ```
    $ git clone git@github.com:<account>/#GITHUB_PROJECT.git
    ```
6. To ensure that upstream changes to the parent repository may be tracked, add the upstream locally as well.
    ```
    $ git remote add upstream git@github.com:#GITHUB_ORG/#GITHUB_PROJECT.git
    ```
----

# Setup Local Environment.

1. Install Composer dependencies.
After you have forked, cloned the project and setup...
2. Setup VM.


## Other Local Setup Steps

1. Set up frontend build and theme.
By default BLT sets up a site with the lightning profile and a cog base theme. You can choose your own profile before setup in the blt.yml file. If you do choose to use cog, see [Cog's documentation](https://github.com/acquia-pso/cog/blob/8.x-1.x/STARTERKIT/README.md#create-cog-sub-theme) for installation.
See [BLT's Frontend docs](https://blt.readthedocs.io/en/latest/frontend/) to see how to automate the theme requirements and frontend tests.
After the initial theme setup you can configure `blt/blt.yml` to install and configure your frontend dependencies with `blt setup`.

---

# Resources 

Additional 


## Resources

* GitHub - https://github.com/#GITHUB_ORG/#GITHUB_PROJECT

