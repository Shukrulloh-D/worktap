import { useNavigate } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
import styles from './new-password.module.css';

export const NewPasswordPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const submit = (e) => {
    e.preventDefault();
    toast('Пароль изменён');
    nav('/login');
  };
  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Давайте восстановим Вам пароль</div>
      <h1 className={styles.title}>Придумайте новый пароль</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>Пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <div>
          <label className={styles.label}>Повтарите пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Изменить пароль</button>
      </form>
    </div>
  );
};
