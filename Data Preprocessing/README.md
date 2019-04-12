# READ ME

To quantify health status, we build binary variables for 6 diseases: Hepatitis, walking disability, heart disease, sexual disease, kidney disease, and diabetes. Each quantifier is based on participant’s laboratory data. For example, quantifier for Hepatitis B is based on core antibody and surface antigen, and Hepatitis C is based on RNA.

Additionally, we handle missing values by filling them with 0 if there is a skip pattern. For example, if the answer to a question “Do you ever had vaginal, oral, or anal sex with other people” is “No”, then all further question related to sexual behaviors would be skipped. 
