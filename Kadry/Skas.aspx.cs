using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry
{
    public partial class Skas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt1 = new DateTime(2012, 9, 22);
            DateTime dt2 = dt1.AddYears(3);
            DateTime dt3 = DateTime.Now;
            int age = dt3.Year - dt1.Year;
            //Label1.Text = age.ToString();

            DateTime compareTo = DateTime.Parse("8/13/2010 8:33:21 AM");
            DateTime now = DateTime.Parse("2/9/2012 10:10:11 AM");
            var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
            Years.Text = ("Years: " + dateSpan.Years);
            Months.Text = ("Months: " + dateSpan.Months);
            Days.Text = ("Days: " + dateSpan.Days);
            Hours.Text = ("Hours: " + dateSpan.Hours);
            Minutes.Text = ("Minutes: " + dateSpan.Minutes);
            Seconds.Text = ("Seconds: " + dateSpan.Seconds);
            Milliseconds.Text = ("Milliseconds: " + dateSpan.Milliseconds);
        }

        public struct DateTimeSpan
        {
            private readonly int years;
            private readonly int months;
            private readonly int days;
            private readonly int hours;
            private readonly int minutes;
            private readonly int seconds;
            private readonly int milliseconds;

            public DateTimeSpan(int years, int months, int days, int hours, int minutes, int seconds, int milliseconds)
            {
                this.years = years;
                this.months = months;
                this.days = days;
                this.hours = hours;
                this.minutes = minutes;
                this.seconds = seconds;
                this.milliseconds = milliseconds;
            }

            public int Years { get { return years; } }
            public int Months { get { return months; } }
            public int Days { get { return days; } }
            public int Hours { get { return hours; } }
            public int Minutes { get { return minutes; } }
            public int Seconds { get { return seconds; } }
            public int Milliseconds { get { return milliseconds; } }

            enum Phase { Years, Months, Days, Done }

            public static DateTimeSpan CompareDates(DateTime date1, DateTime date2)
            {
                if (date2 < date1)
                {
                    var sub = date1;
                    date1 = date2;
                    date2 = sub;
                }

                DateTime current = date1;
                int years = 0;
                int months = 0;
                int days = 0;

                Phase phase = Phase.Years;
                DateTimeSpan span = new DateTimeSpan();

                while (phase != Phase.Done)
                {
                    switch (phase)
                    {
                        case Phase.Years:
                            if (current.AddYears(years + 1) > date2)
                            {
                                phase = Phase.Months;
                                current = current.AddYears(years);
                            }
                            else
                            {
                                years++;
                            }
                            break;
                        case Phase.Months:
                            if (current.AddMonths(months + 1) > date2)
                            {
                                phase = Phase.Days;
                                current = current.AddMonths(months);
                            }
                            else
                            {
                                months++;
                            }
                            break;
                        case Phase.Days:
                            if (current.AddDays(days + 1) > date2)
                            {
                                current = current.AddDays(days);
                                var timespan = date2 - current;
                                span = new DateTimeSpan(years, months, days, timespan.Hours, timespan.Minutes, timespan.Seconds, timespan.Milliseconds);
                                phase = Phase.Done;
                            }
                            else
                            {
                                days++;
                            }
                            break;
                    }
                }
                return span;
            }

            public static int GetMonthsBetween(DateTime from, DateTime to)
            {
                if (from > to) return GetMonthsBetween(to, from);

                var monthDiff = Math.Abs((to.Year * 12 + (to.Month - 1)) - (from.Year * 12 + (from.Month - 1)));

                if (from.AddMonths(monthDiff) > to || to.Day < from.Day)
                {
                    return monthDiff - 1;
                }
                else
                {
                    return monthDiff;
                }
            }
        }
    }
}