<h1 align="center">
  <img src="https://raw.githubusercontent.com/moul/depviz/master/assets/depviz.svg?sanitize=true" alt="Depviz" title="Depviz" height="200px">
  <br>
</h1>

<h3 align="center">👓 Issue dependency visualizer, a.k.a. "auto-roadmap".</h3>

[![CircleCI](https://circleci.com/gh/moul/depviz.svg?style=shield)](https://circleci.com/gh/moul/depviz)
[![GoDoc](https://img.shields.io/static/v1?label=godoc&message=reference&color=blue)](https://pkg.go.dev/moul.io/depviz/v3)
[![License](https://img.shields.io/badge/license-Apache--2.0%20%2F%20MIT-%2397ca00.svg)](https://github.com/moul/depviz/blob/master/COPYRIGHT)
[![GitHub release](https://img.shields.io/github/release/moul/depviz.svg)](https://github.com/moul/depviz/releases)
[![Go Report Card](https://goreportcard.com/badge/moul.io/depviz)](https://goreportcard.com/report/moul.io/depviz)
[![CodeFactor](https://www.codefactor.io/repository/github/moul/depviz/badge)](https://www.codefactor.io/repository/github/moul/depviz)
[![Docker Metrics](https://images.microbadger.com/badges/image/moul/depviz.svg)](https://microbadger.com/images/moul/depviz)
[![GolangCI](https://golangci.com/badges/github.com/moul/depviz.svg)](https://golangci.com/r/github.com/moul/depviz)
[![Made by Manfred Touron](https://img.shields.io/badge/made%20by-Manfred%20Touron-blue.svg?style=flat)](https://manfred.life/)

<!-- [![codecov](https://codecov.io/gh/moul/depviz/branch/master/graph/badge.svg)](https://codecov.io/gh/moul/depviz) -->

## Introduction
dependency visualizer (auto roadmap)

`depviz` aggregates **tasks** from multiple projects and generates visual representations (graphs) of the dependencies.

_inspired by this discussion: [jbenet/random-ideas#37](https://github.com/jbenet/random-ideas/issues/37)_

## Demo

https://depviz-demo.moul.io/

## Supported providers

*Depviz* aggregates the entities of multiple providers into 3 generic ones.

---

Supported providers:

* GitHub
  * Task: Issue, Pull Request, Milestone
  * Owner: TODO
  * Topic: TODO
* GitLab: *(planned)*
* Jira *(planned)*
* Trello *(planned)*

TODO: detailed mapping table

## Under the hood

### Depviz entities

There are 3 entities:

* A `Task` that have a real life cycle: opened->closed
* An `Owner` which only contains things
* A `Topic` which allows categorizing/tagging other things

**Examples**:

* a `Milestone` is a `Depviz Task`, because even if it contains other tasks, it also has a clearly defined lifecycle: to be closed when every children tasks are finished.
* a `Repository` is a `Depviz Owner` because even if you can archive a repository, it's not the normal lifecycle, and will most of the time be unrelated with the amount of tasks done

A `Task` can be considered as something directly actionnable, or indirectly/automatically closable based on a business rule.

**More info here: [./api/dvmodel.proto](./api/dvmodel.proto)**

#### Task

should have:

* a unique `ID`: canonical URL
* a `LocalID`: human-readable identifier
* a `Title`: _not necessarily unique_
* a `Kind`: `Issue`, `Pull Request`, `Milestone`, `Epic`, `Story`, `Card`
* a `State`: `opened`, `in progress`, or `closed`
* an `Owner`: _see below_
* a `Driver`: `GitHub`, `GitLab`, `Jira`, `Trello`

may have:

* other relationships: `Author`, `Milestone`, `Assignees`, `Reviewers`, `Label`, `Dependencies`, `Dependents`, `Related`, `Parts`, `Parents`
* other metadata: `Description`
* other states: `Locked`
* timestamps: `Created`, `Updated`, `Due`, `Completed`
* metrics: `NumDownvotes`, `NumUpvotes`, `NumComments`

#### Owner

should have:

* a unique `ID`: canonical URL
* a `LocalID`: human-readable identifier
* a `Title`: _not necessarily unique_
* a `Kind`: `User`, `Organization`, `Team`, `Repo`, `Provider`
* a `Driver`: `GitHub`, `GitLab`, `Jira`, `Trello`

may have:

* an `Owner`
* other states: `Fork`
* other metadata: `Homepage`, `Description`, `Avatar`, `Fullname`, `Shortname`
* timestamps: `Created`, `Updated`

#### Topic

should have:

* a unique `ID`: canonical URL
* a `LocalID`: human-readable identifier
* a `Title`: _not necessarily unique_
* a `Kind`: `Label`
* a `Driver`: `GitHub`, `GitLab`, `Jira`, `Trello`

may have:

* an `Owner`: _see above_
* other metadata: `Color`, `Description`

## Install

### Download a release

https://github.com/moul/depviz/releases

### Install With Golang

```
go get moul.io/depviz/cmd/depviz/v3
```

### Using brew

```console
$ brew install moul/moul/depviz
```

## Usage

TODO

## License

© 2018-2019 [Manfred Touron](https://manfred.life)

Licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) ([`LICENSE-APACHE`](LICENSE-APACHE)) or the [MIT license](https://opensource.org/licenses/MIT) ([`LICENSE-MIT`](LICENSE-MIT)), at your option. See the [`COPYRIGHT`](COPYRIGHT) file for more details.

`SPDX-License-Identifier: (Apache-2.0 OR MIT)`
