using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobSerialized
{
    [Serializable]
    class Job : IComparable
    {
        private string description;
        private double time;
        private double rate;

        public Job(string description, double time, double rate)
        {
            this.description = description;
            this.time = time;
            this.rate = rate;
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public double Time
        {
            get { return time; }
            set { time = value; }
        }

        public double Rate
        {
            get { return rate; }
            set { rate = value; }
        }

        public double CalcTotalFee()
        {
            return time * rate;
        }

        public static Job operator +(Job job1, Job job2)
        {
            string description = job1.description + " and " + job2.description;
            double time = job1.time + job2.time;
            double rate = (job1.rate + job2.rate) / 2.0;
            return new Job(description, time, rate);
        }

        public int CompareTo(object obj)
        {
            Job job = obj as Job;
            return CalcTotalFee().CompareTo(job.CalcTotalFee());
        }
    }
}
