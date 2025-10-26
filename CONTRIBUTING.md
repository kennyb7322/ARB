# Contributing to ARB SharePoint Template

Thank you for your interest in contributing to the ARB SharePoint Template! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Issues

If you encounter a bug or have a feature request:

1. **Search existing issues** to avoid duplicates
2. **Create a new issue** with:
   - Clear, descriptive title
   - Detailed description of the issue or feature
   - Steps to reproduce (for bugs)
   - Expected vs. actual behavior
   - Environment details (SharePoint version, browser, etc.)
   - Screenshots (if applicable)

### Suggesting Enhancements

We welcome suggestions for improvements:

1. Open an issue with the "enhancement" label
2. Describe the enhancement in detail
3. Explain the use case and benefits
4. Include examples if possible

### Contributing Code

#### Before You Start

1. Fork the repository
2. Create a new branch for your feature/fix
3. Make your changes
4. Test thoroughly
5. Submit a pull request

#### Coding Guidelines

**SharePoint Template (XML)**
- Follow PnP provisioning schema standards
- Use descriptive names for lists, fields, and content types
- Include comments for complex configurations
- Validate XML syntax before committing

**Power Automate Flows (JSON)**
- Use clear action names
- Include descriptions for complex logic
- Validate JSON syntax
- Test flows in a development environment

**Power BI Templates (JSON)**
- Follow Power BI naming conventions
- Document custom measures and calculations
- Test with sample data

**Documentation (Markdown)**
- Use clear, concise language
- Follow existing structure and formatting
- Include examples where helpful
- Update table of contents if needed

#### Pull Request Process

1. **Update Documentation**: Include relevant documentation updates
2. **Test Your Changes**: Ensure everything works as expected
3. **Describe Your Changes**: Provide a clear description in the PR
4. **Link Related Issues**: Reference any related issues
5. **Request Review**: Wait for review from maintainers

### Documentation Contributions

Documentation improvements are always welcome:

- Fix typos or clarify instructions
- Add examples or use cases
- Improve formatting or organization
- Translate to other languages
- Create video tutorials or guides

## Framework Compliance

When contributing, ensure compliance with these frameworks:

### TOGAF
- Align with ADM phases
- Follow architecture principles
- Use standard deliverables

### ITIL v4
- Support Service Value Chain
- Align with best practices
- Enable continual improvement

### NIST/FedRAMP
- Maintain security control mappings
- Follow security best practices
- Document compliance requirements

### CIST/CIJISA
- Support information sharing
- Maintain privacy controls
- Follow security standards

## Areas for Contribution

### High Priority

- Additional Power Automate workflow templates
- Enhanced Power BI visualizations
- Integration with other Microsoft 365 services
- Additional compliance framework support
- Localization/internationalization

### Medium Priority

- Custom SharePoint web parts
- Additional document templates
- Training materials and videos
- Example architecture submissions
- Testing and validation tools

### Nice to Have

- Third-party integrations
- Mobile app support
- Advanced analytics
- AI/ML integration for recommendations
- Automated compliance checking

## Community Guidelines

### Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and grow
- Give credit where due
- Report inappropriate behavior

### Communication

- Use clear, professional language
- Be patient with new contributors
- Ask questions when unclear
- Share knowledge openly
- Collaborate effectively

## Development Setup

### Local Environment

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ARB.git
   cd ARB
   ```

2. **Install prerequisites**
   - PowerShell 7+
   - PnP PowerShell module
   - Visual Studio Code (recommended)
   - Git

3. **Create development branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Testing

Before submitting:

1. **Validate XML/JSON syntax**
2. **Test in development SharePoint site**
3. **Verify Power Automate flows**
4. **Check Power BI dashboards**
5. **Review documentation**

## Versioning

We use [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes

## Release Process

1. Update version numbers
2. Update CHANGELOG.md
3. Tag release in Git
4. Publish release notes
5. Update documentation

## Questions?

- Check existing documentation
- Search closed issues
- Ask in discussions
- Contact maintainers

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for contributing! 🎉

---

**Last Updated**: October 2025
