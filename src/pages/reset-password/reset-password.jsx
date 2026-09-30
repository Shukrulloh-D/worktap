import { useNavigate, Link } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
import styles from './reset-password.module.css';

export const ResetPasswordPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const submit = (e) => {
    e.preventDefault();
    toast('Код отправлен на email');
    nav('/new-password');
  };
  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Мы отправим Вам код для восстановления пароля</div>
      <h1 className={styles.title}>Заполните поле ниже</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>E-mail</label>
          <input className="input" placeholder="E-mail" type="email" />
        </div>
        <div>
          <label className={styles.label}>Код</label>
          <input className="input" placeholder="Код из почты" />
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Отправить код</button>
      </form>
      <div className={styles.bottom}>
        Вспомнили пароль? <Link to="/login" className={styles.link}>Войдите</Link>
      </div>
    </div>
  );
};
