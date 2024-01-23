using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using static System.Console;

namespace JobSerialized
{
    public class DemoJobs
    {
        const string FILENAME = "DATA.SER";

        static void Main(string[] args)
        {
            List<Job> jobs = new List<Job>();
            bool done = false;

            Write("Would you like to load existing Jobs from the file? (Y/N): ");
            string loadJobs = ReadLine();
            if (loadJobs.ToUpper() == "Y")
            {
                jobs = LoadJobsFromFile();
                WriteLine("Jobs loaded from file.");
            }

            while (!done)
            {
                Write("Enter a job description (Q to quit): ");
                string description = ReadLine();
                if (description == "Q" || description == "q")
                {
                    done = true;
                }
                else
                {
                    Write("Enter time in hours: ");
                    double time = double.Parse(ReadLine());
                    Write("Enter rate per hour: ");
                    double rate = double.Parse(ReadLine());
                    Job job = new Job(description, time, rate);
                    jobs.Add(job);
                }
            }

            jobs.Sort();
            WriteLine("\nSorted jobs:");
            foreach (Job job in jobs)
            {
                WriteLine("{0}: {1} hours, {2:c} per hour, {3:c} total", job.Description, job.Time, job.Rate, job.CalcTotalFee());
            }
            WriteLine();

            Write("Would you like to save the Jobs to the file? (Y/N): ");
            string saveJobs = ReadLine();
            if (saveJobs.ToUpper() == "Y")
            {
                SaveJobsToFile(jobs);
                WriteLine("Jobs saved to file.");
            }

            Random rand = new Random();
            int index1 = rand.Next(jobs.Count);
            int index2 = rand.Next(jobs.Count);
            while (index2 == index1)
            {
                index2 = rand.Next(jobs.Count);
            }
            Job combinedJob = jobs[index1] + jobs[index2];
            WriteLine("Randomly combined jobs:");
            WriteLine("{0} + {1} = {2}: {3} hours, {4:c} per hour, {5:c} total", jobs[index1].Description, jobs[index2].Description,
                combinedJob.Description, combinedJob.Time, combinedJob.Rate, combinedJob.CalcTotalFee());
            ReadLine();
        }

        static List<Job> LoadJobsFromFile()
        {
            List<Job> jobs = new List<Job>();
            try
            {
                using (FileStream inFile = new FileStream(FILENAME, FileMode.Open))
                {
                    BinaryFormatter bFormatter = new BinaryFormatter();
                    jobs = bFormatter.Deserialize(inFile) as List<Job>;
                }
            }
            catch (FileNotFoundException)
            {
                WriteLine("File not found.");
            }
            catch (SerializationException)
            {
                WriteLine("Unable to deserialize Jobs from file.");
            }
            return jobs;
        }


        static void SaveJobsToFile(List<Job> jobs)
        {
            try
            {
                using (FileStream outFile = new FileStream(FILENAME, FileMode.Create))
                {
                    BinaryFormatter bFormatter = new BinaryFormatter();
                    bFormatter.Serialize(outFile, jobs);
                }
            }
            catch (IOException)
            {
                WriteLine("Unable to save Jobs to file.");
            }
        }
    }
}
