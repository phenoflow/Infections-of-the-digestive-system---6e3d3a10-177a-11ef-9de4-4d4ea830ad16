cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  gastrointestinal-infections-of-the-digestive-system---secondary:
    run: gastrointestinal-infections-of-the-digestive-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  infections-of-the-digestive-system-unspecified---secondary:
    run: infections-of-the-digestive-system-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: gastrointestinal-infections-of-the-digestive-system---secondary/output
  infections-of-the-digestive-system-gland---secondary:
    run: infections-of-the-digestive-system-gland---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system-unspecified---secondary/output
  infections-of-the-digestive-system---secondary:
    run: infections-of-the-digestive-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system-gland---secondary/output
  tuberculous-infections-of-the-digestive-system---secondary:
    run: tuberculous-infections-of-the-digestive-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system---secondary/output
  amoebic-infections-of-the-digestive-system---secondary:
    run: amoebic-infections-of-the-digestive-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: tuberculous-infections-of-the-digestive-system---secondary/output
  bacterial-infections-of-the-digestive-system---secondary:
    run: bacterial-infections-of-the-digestive-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: amoebic-infections-of-the-digestive-system---secondary/output
  infections-of-the-digestive-system-shigellosis---secondary:
    run: infections-of-the-digestive-system-shigellosis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: bacterial-infections-of-the-digestive-system---secondary/output
  infections-of-the-digestive-system-intestine---secondary:
    run: infections-of-the-digestive-system-intestine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system-shigellosis---secondary/output
  infections-of-the-digestive-system-classified---secondary:
    run: infections-of-the-digestive-system-classified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system-intestine---secondary/output
  infections-of-the-digestive-system-cholera---secondary:
    run: infections-of-the-digestive-system-cholera---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system-classified---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: infections-of-the-digestive-system-cholera---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
