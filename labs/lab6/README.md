# Big Data Ecosystem

## Lab 6: Oozie

### Goals

Chain the Hive actions done in [lab4](../lab4) using Oozie.

### Ressources

The Oozie workflow is composed of:

- The `workflow.base.xml` that contains all the actions to be run (you will have to complete this file)
- The `job.properties` file that contains the job properties, you will have to modify some of them
- The `scripts` folder that will contain our Hive scripts

### Useful links

- [Oozie documentation](https://oozie.apache.org/docs/4.3.1/)
- [Oozie Hive2 Action](https://oozie.apache.org/docs/4.3.1/DG_Hive2ActionExtension.html)

### How to run a workflow

1. Put the workflow folder in HDFS (in your user directory for example)
   ```sh
   hdfs dfs -put -f oozie_wf/ "/user/$USER"
   ```
2. Submit the job using the `oozie` CLI
   ```sh
   oozie job -run -config oozie_wf/job.properties -oozie http://oozie-1.au.adaltas.cloud:11000/oozie
   ```
3. To get the status of the job:
   1. From the CLI:
      ```sh
      oozie job -info 0000040-201011090406050-oozie-oozi-W -oozie http://oozie-1.au.adaltas.cloud:11000/oozie
      ```
   2. From the web UI: http://oozie-1.au.adaltas.cloud:11000/oozie
4. (With the CLI) To get appliction logs:
   1. Find the action `Ext ID` (e.g. `job_1602801542108_7429`)
   2. Use the YARN CLI to get the application logs (replace `job_` by `application_`):
      ```sh
      yarn logs -applicationId application_1602801542108_7429 | grep -P '^LogType:stderr' -A 200 | grep 'Connected to: Apache Hive' -A 100
      ```

### TO DO

1. Complete the `workflow.base.xml` to be able to run it (2 parameters to add: `jdbc-url`, `script`)
2. Adapt the `job.properties` to your workflow
3. Run the job
4. Make sure there are no errors
5. Add actions to the workflow:
   1. Create the ORC drivers table if it does not exist
   2. Insert new data from the CSV table to the ORC table

### How to check Hive action logs

1. Open the Oozie web UI with Firefox http://oozie-1.au.adaltas.cloud:11000/oozie
2. Find the MapReduce application URL:
   1. Open your job
   2. Open the action in `ERROR` state
   3. Find the YARN applictaion URL in the `Console URL` field
3. Read the logs on the MapReduce UI:
   1. Click on the `Map` link
   2. Click on the `task_xxxxxxxxxxxxx_xxxx_m_000000` link
   3. Click on the `logs` link
   4. Scroll to find the `stderr` section
   5. `Click here for the full log.`
