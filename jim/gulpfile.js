const gulp = require('gulp');
const watch = require('gulp-watch');
const { execSync } = require('child_process');

gulp.task('watch', () => {
  watch('./**/*.jack')
    .on('data', () => {
      execSync("../../tools/JackCompiler.sh source/", {
        stdio: "inherit"
      });
    });
});
