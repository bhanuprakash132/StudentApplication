using Microsoft.AspNetCore.Mvc;
using StudentApplication.Models;
using StudentApplication.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentApplication.Controllers
{
    public class StudentController : Controller
    {
        public StudentApplicationContext _context { get; }
        public StudentController(StudentApplicationContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            List<StudentSubjectViewModel> objList = new List<StudentSubjectViewModel>();
            var result = (from s in _context.Students
                          join m in _context.Marks on s.Id equals m.StudentId
                          join sub in _context.Subjects on m.SubId equals sub.SubjectId
                          into temp
                          from tem in temp.DefaultIfEmpty()
                          select new StudentSubjectViewModel
                          {
                              Id = s.Id,
                              SubjectId = tem.SubjectId,
                              FirstName = s.FirstName,
                              LastName = s.LastName,
                              ClassName = s.ClassName,
                              SubjectName = tem.SubjectName,
                              Marks = m.Marks,
                              SerialNo = s.Id
                          }).OrderBy(x => x.Id).ToList();

            foreach (var item in result)
            {
                objList.Add(item);
                if (objList.Where(x => x.Id == item.Id).Count() > 1)
                {
                    item.Id = 0;
                    item.FirstName = "";
                    item.LastName = "";
                    item.ClassName = "";
                }
            }
            return View(objList);
        }

        public IActionResult AddStudent()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddStudent(StudentSubjectViewModel model)
        {
            if (ModelState.IsValid)
            {
                var objStd = new Student();
                objStd.FirstName = model.FirstName;
                objStd.LastName = model.LastName;
                objStd.ClassName = model.ClassName;
                _context.Students.Add(objStd);
                _context.SaveChanges();
            }
            //return RedirectToAction("Index");
            return Json("Added Successfully");
        }
        public IActionResult AssignSubject()
        {
            var result = _context.Students.ToList();
            return View(result);
        }

        public IActionResult ManageSubject(int studentId)
        {
            ViewBag.studentId = studentId;
            var result = (from s in _context.Subjects
                          join m in _context.Marks.Where(x => x.StudentId == studentId)
                          on s.SubjectId equals m.SubId
                          into temp
                          from tem in temp.DefaultIfEmpty()
                          select new ManageStudentSubjectViewModel
                          {
                              SubjectId = s.SubjectId,
                              SubjectName = s.SubjectName,
                              Marks = tem.Marks
                          }).ToList();
            return View(result);
        }
        [HttpPost]
        public IActionResult ManageSubject(List<ManageStudentSubjectViewModel> viewModel)
        {
            if (viewModel != null)
            {
                foreach (var item in viewModel)
                {
                    var existing = _context.Marks.FirstOrDefault(R => R.SubId == item.SubjectId && R.StudentId == item.StudentId);

                    if (existing != null)
                    {
                        _context.Marks.Update(existing);
                    }
                    else
                    {
                        Mark mk = new Mark();
                        mk.SubId = item.SubjectId;
                        mk.StudentId = item.StudentId;
                        mk.Marks = item.Marks;
                        _context.Marks.Add(mk);
                    }
                }
                _context.SaveChanges();
                return RedirectToAction("AssignSubject");
            }
            return Json("No Data");
        }

        [HttpGet]
        public IActionResult EditStudent(int studentId, int subjectId)
        {
            var result = (from s in _context.Students
                          join m in _context.Marks.Where(x => x.StudentId == studentId && x.SubId == subjectId) on s.Id equals studentId
                          join sub in _context.Subjects
                          on m.SubId equals sub.SubjectId
                          into temp
                          from tem in temp.DefaultIfEmpty()
                          select new StudentSubjectViewModel
                          {
                              StudentId = s.Id,
                              FirstName = s.FirstName,
                              LastName = s.LastName,
                              ClassName = s.ClassName,
                              SubjectId = tem.SubjectId,
                              SubjectName = tem.SubjectName,
                              Marks = m.Marks
                          }).FirstOrDefault();
            return View(result);
        }

        [HttpPost]
        public IActionResult EditStudent(StudentSubjectViewModel model)
        {
            var student = _context.Students.FirstOrDefault(x => x.Id == model.StudentId);
            var subject = _context.Marks.FirstOrDefault(x => x.SubId == model.SubjectId);
            if (student == null)
            {
                ViewBag.ErrorMessage = $"Student with Id = {model.Id} cannot be found";
                return View("NotFound");
            }
            else
            {
                student.FirstName = model.FirstName;
                student.LastName = model.LastName;
                student.ClassName = model.ClassName;
                subject.SubId = model.SubjectId;
                subject.Marks = model.Marks;
                _context.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public IActionResult DeleteStudent(int studentId)
        {
            var subject = _context.Marks.Where(x => x.StudentId == studentId).ToList();
            if (subject != null)
            {
                foreach (var item in subject)
                {
                    _context.Marks.Remove(item);
                }
            }
            var student = _context.Students.FirstOrDefault(m => m.Id == studentId);
            _context.Students.Remove(student);
            _context.SaveChanges();

            //TempData["successMessage"] = "Student Deleted Successfully.";
            //TempData.Keep();
            return RedirectToAction("Index");
        }
    }
}
