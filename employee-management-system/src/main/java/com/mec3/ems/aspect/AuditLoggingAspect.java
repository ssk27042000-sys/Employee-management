
package com.mec3.ems.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AuditLoggingAspect {

    private static final Logger logger =
            LoggerFactory.getLogger(AuditLoggingAspect.class);

    @Around("execution(* com.mec3.ems.service.EmployeeService.*(..))")
    public Object auditServiceMethods(
            ProceedingJoinPoint joinPoint) throws Throwable {

        String methodName =
                joinPoint.getSignature().getName();

        logger.info("AUDIT START: {}", methodName);

        try {
            Object result = joinPoint.proceed();
            logger.info("AUDIT SUCCESS: {}", methodName);
            return result;
        } catch (Throwable ex) {
            logger.error("AUDIT FAILURE: {} - {}",
                    methodName, ex.getMessage());
            throw ex;
        }
    }
}
