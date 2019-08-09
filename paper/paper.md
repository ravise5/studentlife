---
title: 'studentlife: Tidy Handling and Navigation of a Valuable Mobile-Health Dataset'
tags:
  - R
  - StudentLife
  - digital phenotyping
  - machine learning
  - mobile health
  - smartphones
  - behavioural inference
authors:
 - name: Daniel Fryer
   orcid: 0000-0001-6032-0522
   affiliation: "1, 2"
 - name: Hien Nguyen
   orcid: 0000-0002-9958-432X
   affiliation: 1
 - name: Pierre Orban
   affiliation: 3
affiliations:
 - name: Department of Mathematics and Statistics, La Trobe University, Bundoora 3086,
    Victoria Australia
   index: 1
 - name: School of Mathematics and Physics, University of Queensland, St. Lucia 4072,
    Queensland Australia
   index: 2
 - name: Department of Psychiatry, University of Montreal, Monstreal H3C 3J7,
    Quebec Canada
   index: 3
date: 4 July 2019
bibliography: paper.bib
---

# Summary
Smartphones have become ubiquitous; and nearly constantly accompany their owners, as they go about their daily lives. This sensor-rich and computationally-efficient technology allows quantifying continuous streams of human behaviors and activities unobtrusively and *in situ*, a process referred to as digital phenotyping [@Onnela:2016]. Two main types of data collected through this approach can be distinguished: on the one hand, active data that involve the voluntary participation of users, as required for surveys; and on the other hand, passive data that do not involve any dedicated action from users, as is the case for data generated by various sensors embedded in the smartphones.

The R package [@RCore:2019] **``studentlife``** is designed to assist in downloading, navigating and analysing the **StudentLife** dataset. The **StudentLife** dataset [@Wang:2014] is a one-of-its-kind digital phenotyping dataset made publicly available (https://studentlife.cs.dartmouth.edu) by Wang, Campbell and colleagues, at Dartmouth College (New Hampshire, United States). It consists of a rich array of data, collected through a dedicated mobile app, over a 10-week term in a sample of 48 college students. Active data were obtained through ecological momentary assessments, corresponding to self-reports of the students’ states, prompted multiple times per day (3 to 13 daily assessments) at pseudorandom intervals. Likert scale-based questions (e.g., regarding stress, exercise, social activity, etc) that changed across assessments, were systematically preceded by a photographic affect meter that captured the students’ instantaneous mood in an original fashion, hence promoting the collection of a large amount of affect data. Passive data were also continuously collected through smartphone sensors (e.g., accelerometer, microphone, GPS, etc). A key valuable aspect of the **StudentLife** dataset is that it does not merely share raw sensor data. Indeed, a number of behavioral inferences based on trained machine learners were automatically computed by the mobile app and are also included in the dataset, which includes, for example, type of physical activity, audio/conversation state, and sleep duration. Finally, the dataset contains data from pre- and post-term surveys aimed at assessing mental health with a series of well-validated questionnaires and scales (e.g., PHQ-9 to screen for the presence and severity of depression), as well as a number of measures related to academic context and performance. 

While the primary focus of the **StudentLife** project is on mental well-being in educational settings, the publicly shared dataset could serve a more general purpose in addressing novel questions on the temporal dynamics of mental health at large. Digital phenotyping is promised to revolutionize clinical research and healthcare, yet research on mental health using smartphone sensing is only nascent and studies that have employed ecological momentary assessment in clinical samples typically follow subjects for much shorter durations than in the **StudentLife** project. Furthermore, this dataset is well-suited for developing methods tailored to analyzing the high-dimensional and intensively longitudinal data that arise from digital phenotyping.

The **``studentlife``** package provides functionality to assist users to: 

* Download either the full dataset or a smaller sub-sample dataset.
* Organise the data intuitively into tables and schemas (i.e., collections of similar tables).
* Use a convenient interactive menu for browsing schemas and importing tables or subsets thereof.
* Classify tables based on their time information: timestamped, interval, date-only or dateless.
* Aggregate observations within blocks of time. For example, within each hour, day or week.
* Perform exploratory data analysis, such as visualisation of missing values and response
frequencies. 

For an introduction to using this package, view the [README file](https://github.com/frycast/studentlife/blob/master/README.md) on GitHub. The latest stable build can be found [on CRAN](https://CRAN.R-project.org/package=studentlife). Please give your feedback and report bugs at the GitHub [issues page](https://github.com/frycast/studentlife/issues).

# References