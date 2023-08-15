declare
   cursor cur_Dept is
       select last_name,salary
       from employees
       where department_id=90;
begin
  FOR REG_DEPT IN CUR_DEPT LOOP
     dbms_output.put_line (REG_DEPT.LAST_NAME || ' ' || REG_DEPT.SALARY);
  END LOOP;
END;
/

-- outra forma de trabalhar

begin
  FOR REG_DEPT IN (select last_name,salary
                   from employees
                   where department_id=90)LOOP
     dbms_output.put_line (REG_DEPT.LAST_NAME || ' ' || REG_DEPT.SALARY);
  END LOOP;
END;
/